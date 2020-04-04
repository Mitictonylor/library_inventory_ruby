require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


require_relative('../models/book')



class TestBook < Minitest::Test

  def setup()
    @book1 = Book.new({'title' => 'Pride and prejudice',
                      'description' => 'The number one of his genre',
                      'stock' => 20,
                      'buying_cost' => 10.0,
                      'selling_cost' => 15.0,
                      'author_id' => 1 ,
                      'genre_id' => 1,
                      'publisher_id' => 1
                    })
    @book2 = Book.new({'title' => 'Things Fall Apart',
                      'description' => 'Nelson Mandela life',
                      'stock' => 2,
                      'buying_cost' => 12.0,
                      'selling_cost' => 20.0,
                      'author_id' => 1 ,
                      'genre_id' => 1,
                      'publisher_id' => 1
                    })

    @book3 = Book.new({'title' => '1984 Nineteen Eighty-Four',
                      'description' => 'From a true story',
                      'stock' => 0,
                      'buying_cost' => 5.0,
                      'selling_cost' => 7.50,
                      'author_id' => 1,
                      'genre_id' => 1,
                      'publisher_id' => 1
                    })





  end

  def test_stock_level_good()
    assert_equal("In stock", @book1.stock_level())
  end

  def test_stock_level_low()
    assert_equal("Low level of stock", @book2.stock_level())
  end

  def test_stock_level_none()
    assert_equal("Out of stock", @book3.stock_level())
  end
end
