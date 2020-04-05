require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative( '../models/publisher.rb' )
require_relative('../models/book.rb')
also_reload('../models/*')

get '/publishers' do
  @publishers = Publisher.all()
erb(:"publishers/index")
end
