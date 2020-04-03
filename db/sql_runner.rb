# require the pg packet that allow us to interact with the database through postgresql
require('PG')

class Sqlrunner
#create a class method that will require the sql and the values to associate to the sql
  def self.run(sql,values =[])
    #The begin block is where we do the thing we want to do
    begin
      #create a connection to our DB
      db = PG.connect({dbname: 'book_shop', host: 'localhost'})
      #we associate query to the sql command we want to run
      db.prepare('query',sql)
      #we execute the query(sql) giving the values to substitute the $placeholders$
      result = db.exec_prepared('query',values)
      #The ensure block is stuff we want to make sure happens even if an error is thrown in the begin block
    ensure
      #We close the connection
      db.close() if db != nil
    end
    return result
  end
end
