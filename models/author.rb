require_relative('../db/sql_runner.rb')

class Author

  attr_accessor :name
  attr_reader :id

  def initialize(author)
    @id = author['id'].to_i if author['id']
    @name = author['name']
  end

  def save()
    sql = "INSERT INTO authors (name) VALUES ($1) RETURNING id"
    values = [@name]
    #we run sqlrunner to create the raw in the table and we catch the id that will automatically be assigned when creating a raw in a table
    @id = SqlRunner.run(sql,values)[0]['id'].to_i
  end
end
