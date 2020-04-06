* README
* Prerequirement :
* sinatra and sinatracontrib installed (gem install sinatra sinatra-contrib)
* PG (gem install pg )
* PRY (gem install pry pry-byebug )
*
*
* To run the app:
* 1 - Download the whole repo
* 2 - Create database in your terminal (createdb book_store)
* 3 - associate the db to the sql file (psql -d book_store -f db/book_shop.sql)
* 4 - run the console.rb to populate the db (ruby db/console.rb)
* 5 - run the sinatra server (ruby controller.rb)
* 6 - open Chrome and go to http://localhost:4567/
