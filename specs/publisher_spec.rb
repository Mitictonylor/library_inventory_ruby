require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


require_relative('../models/publisher')



class TestPublisher < Minitest::Test

  def setup()
    @publisher1 = Publisher.new({'name' => 'Wordsworth Editions', 'active' => true})
    @publisher2 = Publisher.new({'name' => 'Puffin', 'active' => false})
  end

  def test_active_is_true()
    assert_equal(true, @publisher1.active?())
  end

  def test_active_is_false()
    assert_equal(false, @publisher2.active?())
  end




end
