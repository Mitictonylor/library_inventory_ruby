require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative( '../models/publisher.rb' )
require_relative('../models/book.rb')
also_reload('../models/*')

get '/publishers' do
  @publishers = Publisher.all()
  erb(:"publishers/index")
end
get '/publishers/new' do
  @publisher= Publisher.all()
  erb( :"publishers/new")
end

get '/publishers/:id' do
  @books = Publisher.all_the_books_by_publisher(params['id'].to_i)
  erb(:"publishers/show")
end

get '/publishers/:id/edit' do
  id = params['id'].to_i
  @publisher = Publisher.find_by_publisher_id(id)
  erb( :"publishers/edit" )
end

post '/publishers' do
  new_publisher = Publisher.new(params)
  new_publisher.save()
  erb(:"publishers/create")
end

post '/publishers/:id' do
  
  publisher = Publisher.new(params)
  publisher.update()
  redirect('/publishers')
end
