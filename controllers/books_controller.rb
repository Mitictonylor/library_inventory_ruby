require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative( '../models/book.rb' )
require_relative( '../models/author.rb' )
require_relative( '../models/genre.rb' )
require_relative( '../models/publisher.rb' )

also_reload( '../models/*' )

  get '/books' do
    @books = Book.all()
    erb ( :"books/index" )
  end

  get '/books/new' do
    @authors = Author.all()
    @publishers = Publisher.all()
    @genres = Genre.all()

    erb(:"books/new")
  end

  get '/books/:id' do
    id = params['id'].to_i
    @book = Book.find_by_book_id(id)
    erb( :"books/show")
  end

  post '/books' do
    new_book = Book.new(params)
    new_book.save
    erb(:"books/create")
  end
