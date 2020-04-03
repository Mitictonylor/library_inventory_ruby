require_relative('../db/sql_runner.rb')

class Publisher

  attr_accessor :name, :active
  attr_reader :id

  def initialize(publisher)
    @id = publisher['id'].to_i if publisher['id']
    @name = publisher['name']
    @active = publisher['active']
  end

  def save()
    sql = "INSERT INTO publishers (name, active) VALUES ($1, $2) RETURNING id"
    values = [@name, @active]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end
end
