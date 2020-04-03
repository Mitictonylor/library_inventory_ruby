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

end
