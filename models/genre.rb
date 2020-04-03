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
  all = SqlRunner.run(sql,values)
  return all.map{|author| Author.new(author)}
end

def self.delete_all()
  sql = "DELETE FROM genres"
  SqlRunner.run(sql)
end
