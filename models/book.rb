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






end
