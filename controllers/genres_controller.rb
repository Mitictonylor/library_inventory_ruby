require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative( '../models/genre.rb' )
also_reload('../models/*')

get '/genres' do
  @genres = Genre.all()
  erb ( :"genres/index" )
end

get '/genres/:id' do
  erb(:"genres/show")
end
