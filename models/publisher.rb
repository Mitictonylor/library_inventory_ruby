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

  def update()
    sql = "UPDATE publishers SET (name, active) = ($1, $2) WHERE id = $3"
    values = [@name, @active, @id]
    return SqlRunner.run(sql,values)
  end

  def delete()
    sql = "DELETE FROM publishers WHERE id = $1"
    values = [@id]
     return SqlRunner.run(sql,values)
  end

  def self.all()
    sql = "SELECT * FROM publishers"
    all = SqlRunner.run(sql)
    return all.map{|publisher| Publisher.new(publisher)}
  end

  def self.delete_all()
    sql = "DELETE FROM publishers"
    SqlRunner.run(sql)
  end

  def self.find_by_publisher_id(publisher_id)
    sql = "SELECT * FROM publishers WHERE id = $1"
    values = [publisher_id]
    return SqlRunner.run(sql,values).first
  end
end
