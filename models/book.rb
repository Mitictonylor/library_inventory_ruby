require_relative('../db/sql_runner.rb')

class Book

  attr_reader :id
  attr_accessor :title, :description, :stock, :buying_cost, :selling_cost, :author_id, :genre_id, :publisher_id


  def initialize(book)
    @id = book['id'].to_i if book['id']
    @title = book['title']
    @description = book['description']
    @stock = book['stock'].to_i
    @buying_cost = book['buying_cost'].to_f
    @selling_cost = book['selling_cost'].to_f
    @author_id = book['author_id'].to_i
    @genre_id = book['genre_id'].to_i
    @publisher_id = book['publisher_id'].to_i
  end

  def save()
    sql = "INSERT INTO books
          (title, description, stock, buying_cost, selling_cost, author_id, genre_id, publisher_id)
          VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING id"
    values = [@title, @description, @stock, @buying_cost, @selling_cost, @author_id, @genre_id, @publisher_id]
    @id = SqlRunner.run(sql,values)[0]['id'].to_i
  end

  def update()
    sql = "UPDATE books SET
          (title, description, stock, buying_cost, selling_cost, author_id, genre_id, publisher_id)
          = ($1, $2, $3, $4, $5, $6, $7, $8) WHERE id = $9"
    values = [@title, @description, @stock, @buying_cost, @selling_cost, @author_id, @genre_id, @publisher_id, @id]
    return SqlRunner.run(sql,values)
  end

  def delete()
    sql = "DELETE FROM books WHERE id = $1"
    values = [@id]
     return SqlRunner.run(sql,values)
  end

  def self.all()
    sql = "SELECT * FROM books"
    all = SqlRunner.run(sql)
    return all.map{|book| Book.new(book)}
  end

  def self.delete_all()
    sql = "DELETE FROM books"
    SqlRunner.run(sql)
  end

  def self.find_by_book_id(book_id)
    sql = "SELECT * FROM books WHERE id = $1"
    values = [book_id]
    book = SqlRunner.run(sql,values).first
    return nil if book == nil
    return Book.new(book)
  end

  def stock_level()
    if @stock.between?(1,5)
      return "Low level of stock"
    elsif @stock == 0
      return "Out of stock"
    else
      return "In stock"
    end
  end

  def mark_up()
    return @selling_cost - @buying_cost
  end

  def author()
    sql = "SELECT * FROM authors WHERE id = $1"
    values = [@author_id]
    author = SqlRunner.run(sql,values).first
    return Author.new(author)
  end

  def publisher()
    sql = "SELECT * FROM publishers WHERE id = $1"
    values = [@publisher_id]
    publisher = SqlRunner.run(sql,values).first
    return Publisher.new(publisher)
  end

  def genre()
    sql = "SELECT * FROM genres WHERE id = $1"
    values = [@genre_id]
    genre = SqlRunner.run(sql,values).first
    return Genre.new(genre)
  end

  def self.low_stock()
    sql = "SELECT * FROM books WHERE stock <=5"
    low_stock_books = SqlRunner.run(sql)
    return low_stock_books.map{|book| Book.new(book)}
  end


end
