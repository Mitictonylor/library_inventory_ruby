require('PG')

class Sqlrunner

  def self.run(sql,values =[])
    begin
      db = PG.connect({dbname: 'book_shop', host: 'localhost'})
      db.prepare('query',sql)
      result = db.exec_prepared('query',values)
    ensure
      db.close() if db != nil
    end
    return result
  end
end
