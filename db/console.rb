require('pry-byebug')
require_relative('../models/author.rb')
require_relative('../models/genre.rb')
require_relative('../models/publisher.rb')
require_relative('../models/book.rb')

Book.delete_all()
Author.delete_all()
Publisher.delete_all()
Genre.delete_all()


author1= Author.new({'name' => 'Jane Austen'})
author2= Author.new({'name' => 'Roald Dahl'})
author3= Author.new({'name' => 'Chinua Achebe'})
author4= Author.new({'name' => 'George Orwell'})
author5= Author.new({'name' => 'Charles Dickens'})
author6= Author.new({'name' => 'Daphne du Maurier'})

author1.save()
author2.save()
author3.save()
author4.save()
author5.save()
author6.save()

genre1= Genre.new({'name' => 'novel'})
genre2= Genre.new({'name' => 'political fiction'})
genre3= Genre.new({'name' => 'literary fiction'})
genre4= Genre.new({'name' => 'fantasy fiction'})
genre5= Genre.new({'name' => 'classic fiction'})
genre6= Genre.new({'name' => 'romance'})

genre1.save()
genre2.save()
genre3.save()
genre4.save()
genre5.save()
genre6.save()

publisher1 = Publisher.new({'name' => 'Wordsworth Editions', 'active' => true})
publisher2 = Publisher.new({'name' => 'Puffin', 'active' => true})
publisher3 = Publisher.new({'name' => 'Penguin classic', 'active' => true})
publisher4 = Publisher.new({'name' => 'Virago', 'active' => true})

publisher1.save()
publisher2.save()
publisher3.save()
publisher4.save()

book1 = Book.new({'title' => 'Pride and prejudice',
                  'description' => 'The number one of his genre',
                  'stock' => 20,
                  'buying_cost' => 10.0,
                  'selling_cost' => 15.0,
                  'author_id' => author1.id,
                  'genre_id' => genre1.id,
                  'publisher_id' => publisher1.id
                })

book2 = Book.new({'title' => 'Charlie and the Chocolate Factory',
                  'description' => 'One of the best',
                  'stock' => 14,
                  'buying_cost' => 8.0,
                  'selling_cost' => 12.0,
                  'author_id' => author2.id,
                  'genre_id' => genre5.id,
                  'publisher_id' => publisher2.id
                })

book3 = Book.new({'title' => 'Things Fall Apart',
                  'description' => 'Nelson Mandela life',
                  'stock' => 2,
                  'buying_cost' => 12.0,
                  'selling_cost' => 20.0,
                  'author_id' => author3.id,
                  'genre_id' => genre2.id,
                  'publisher_id' => publisher3.id
                })

book4 = Book.new({'title' => '1984 Nineteen Eighty-Four',
                  'description' => 'From a true story',
                  'stock' => 0,
                  'buying_cost' => 5.0,
                  'selling_cost' => 7.50,
                  'author_id' => author4.id,
                  'genre_id' => genre2.id,
                  'publisher_id' => publisher3.id
                })

book5 = Book.new({'title' => 'Rebecca',
                  'description' => 'Full of inventive',
                  'stock' => 33,
                  'buying_cost' => 2.0,
                  'selling_cost' => 4.50,
                  'author_id' => author6.id,
                  'genre_id' => genre5.id,
                  'publisher_id' => publisher4.id
                })

book6 = Book.new({'title' => 'Great Expectations',
                  'description' => 'Very intriguing',
                  'stock' => 4,
                  'buying_cost' => 17.0,
                  'selling_cost' => 20.75,
                  'author_id' => author5.id,
                  'genre_id' => genre5.id,
                  'publisher_id' => publisher1.id
                })
book7 = Book.new({'title' => 'Mansfield park',
                  'description' => 'a Classic',
                  'stock' => 0,
                  'buying_cost' => 7.0,
                  'selling_cost' => 12.0,
                  'author_id' => author1.id,
                  'genre_id' => genre5.id,
                  'publisher_id' => publisher1.id
                })
book1.save()
book2.save()
book3.save()
book4.save()
book5.save()
book6.save()
book7.save()


binding.pry
nil
