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
end
