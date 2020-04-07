require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/genre.rb')
require_relative('../models/book.rb')
also_reload('../models/*')

get '/genres' do
  @genres = Genre.all()
  erb :"genres/index"
end

get '/genres/new' do
  erb(:"genres/new")
end

get '/genres/:id' do
  id = params['id'].to_i
  @books = Genre.all_the_book_by_genre(id)
  erb(:"genres/show")
end

get '/genres/:id/edit' do
  id = params['id'].to_i
  @genre = Genre.find_by_genre_id(id)
  erb(:"genres/edit")
end

post '/genres' do
  new_genre = Genre.new(params)
  new_genre.save()
  erb(:"genres/create")
end

post '/genres/:id' do
  genre = Genre.new(params)
  genre.update()
  redirect('/genres')
end
