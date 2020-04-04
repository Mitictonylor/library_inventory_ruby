require_relative('../db/sql_runner.rb')

class Author
  #we give the get and set available to the name property
  attr_accessor :name
  #we give the get available to the id property, we don't want to modify it
  attr_reader :id

  #we initialize the class passing an hash, then we save each property from
  #we give the get and set available to the name property the hash and we make
  #them available to the whole class through @

  def initialize(author)
    @id = author['id'].to_i if author['id']
    @name = author['name']
  end

  def save()
    sql = "INSERT INTO authors (name) VALUES ($1) RETURNING id"
    values = [@name]
    #we run sqlrunner to create the raw in the table and we catch the id that will
    # automatically be assigned when creating a raw in a table
    @id = SqlRunner.run(sql,values)[0]['id'].to_i
  end

  def update()
    sql = "UPDATE authors SET name = $1 WHERE id = $2"
    values = [@name, @id]
    return SqlRunner.run(sql,values)
  end

  def delete()
    sql = "DELETE FROM authors WHERE id = $1"
    values = [@id]
     return SqlRunner.run(sql,values)
  end

  def self.all()
    sql = "SELECT * FROM authors"
    all = SqlRunner.run(sql)
    return all.map{|author| Author.new(author)}
  end

  def self.delete_all()
    sql = "DELETE FROM authors"
    SqlRunner.run(sql)
  end

  def all_the_book_written_by_author()
    sql = "SELECT books.* FROM books
          INNER JOIN authors
          ON authors.id = books.author_id
          WHERE books.author_id = $1"
    values = [@id]
    books = SqlRunner.run(sql,values)
    return books.map{|book| Book.new(book)}
  end

  def all_the_genre_written_by_author()
    sql = "SELECT DISTINCT genres.* FROM genres
          INNER JOIN books
          ON genres.id = books.genres_id
          WHERE books.author_id = $1"
    values = [@id]
    genres = SqlRunner.run(sql,values)
    return genres.map{|genre| Genre.new(genre)}
  end

  def all_the_publisher_by_author()
    sql ="SELECT DISTINCT publishers.* FROM publishers
          INNER JOIN books
          ON books.publisher_id = publishers.id
          WHERE books.author_id = $1"
    values = [@id]
    publishers = SqlRunner.run(sql,values)
    return publishers.map{|publisher| Publisher.new(publisher)}
  end

  def self.find_by_author_id(author_id)
    sql = "SELECT * FROM authors WHERE id = $1"
    values = [author_id]
    return SqlRunner.run(sql,values).first
  end

end
