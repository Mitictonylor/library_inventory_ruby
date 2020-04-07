require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/author.rb')
require_relative('../models/book.rb')
also_reload('../models/*')

get '/authors' do
  @authors = Author.all()
  erb :"authors/index"
end

get '/authors/new' do
  erb(:"authors/new")
end

get '/authors/:id' do
  id = params['id'].to_i
  @books = Author.all_the_book_written_by_author(id)
  erb(:"authors/show")
end

get '/authors/:id/edit' do
  id = params['id'].to_i
  @author = Author.find_by_author_id(id)
  erb(:"authors/edit")
end

post '/authors' do
  new_author = Author.new(params)
  new_author.save()
  erb(:"authors/create")
end

post '/authors/:id' do
  author = Author.new(params)
  author.update()
  redirect '/authors'
end
