require_relative('../db/sql_runner.rb')

class Publisher

  attr_accessor :name
  attr_reader :id

  def initialize(publisher)
    @id = publisher['id'].to_i if publisher['id']
    @name = publisher['name']
    @active = publisher['active'].to_b
  end

  def save()
    sql = "INSERT INTO publishers (name, active) VALUES ($1, $2) RETURNING id"
    values = [@name, @active]
    @id = SqlRunner.run(sql,values)[0]['id'].to_i
  end
end
