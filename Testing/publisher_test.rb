require 'test_helper'

class PublisherTest < ActiveSupport::TestCase
  test "Publishers Exist" do
    assert_equal 2, Publisher.count
  end
  
  test "Publisher Validation" do
    p = Publisher.new
    p.save
    assert_equal 2, Publisher.count
    
    p = Publisher.new :name => 'test'
    p.save
    assert_equal 3, Publisher.count
  end
  
  test "Publishers have Books" do
    # assert_equal [books(:three), books(:one)], publishers(:one).books
    assert_equal 2, publishers(:one).books.size
    # assert_equal [books(:two)], publishers(:two).books
    assert_equal 1, publishers(:two).books.size
  end
end
