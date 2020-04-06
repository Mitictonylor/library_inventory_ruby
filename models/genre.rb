require_relative('../db/sql_runner.rb')

class Genre

  attr_reader :id
  attr_accessor :name

  def initialize(genre)
    @id = genre['id'].to_i if genre['id']
    @name = genre['name']
  end

  def save()
    sql = "INSERT INTO genres (name) VALUES ($1) RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql,values)[0]['id'].to_i
  end

  def update()
    sql = "UPDATE genres SET name = $1 WHERE id = $2"
    values = [@name, @id]
    return SqlRunner.run(sql,values)
  end

  def delete()
    sql = "DELETE FROM genres WHERE id = $1"
    values = [@id]
     return SqlRunner.run(sql,values)
  end

  def self.all()
    sql = "SELECT * FROM genres"
    all = SqlRunner.run(sql)
    return all.map{|genre| Genre.new(genre)}
  end

  def self.delete_all()
    sql = "DELETE FROM genres"
    SqlRunner.run(sql)
  end

  def self.find_by_genre_id(genre_id)
    sql = "SELECT * FROM genres WHERE id = $1"
    values = [genre_id]
    genres = SqlRunner.run(sql,values).first
    return nil if genres == nil
    return Genre.new(genres)
  end


  def all_the_publisher_by_genre()
    sql ="SELECT DISTINCT publishers.* FROM publishers
          INNER JOIN books
          ON books.publisher_id = publishers.id
          WHERE books.genre_id = $1"
    values = [@id]
    publishers = SqlRunner.run(sql,values)
    return publishers.map{|publisher| Publisher.new(publisher)}
  end

  def all_the_authors_by_genre()
    sql = "SELECT DISTINCT authors.* FROM authors
          INNER JOIN books
          ON authors.id = books.author_id
          WHERE books.genre_id = $1"
    values = [@id]
    authors = SqlRunner.run(sql,values)
    return authors.map{|author| Author.new(author)}
  end

  def self.all_the_book_by_genre(genre_id)
    sql = "SELECT DISTINCT books.* FROM books
          INNER JOIN genres
          ON genres.id = books.genre_id
          WHERE books.genre_id = $1"
    values = [genre_id]
    books = SqlRunner.run(sql,values)
    return books.map{|book| Book.new(book)}
  end










end
