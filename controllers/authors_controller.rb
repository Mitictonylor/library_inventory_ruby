require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative( '../models/author.rb' )
require_relative('../models/book.rb')
also_reload('../models/*')

get '/authors' do
  @authors = Author.all()
  erb ( :"authors/index" )
end

get '/authors/:id' do
  id = params['id'].to_i
 @books = Author.all_the_book_written_by_author(id)
  erb( :"authors/show" )
end
