require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  test "Authors Exist" do
    assert_equal 2, Author.count
  end
  
  test "Author Validations" do
    a = Author.new( :first_name => 'test' )
    a.save
    assert_equal 2, Author.count
    
    a = Author.new( :last_name => 'test' )
    a.save
    assert_equal 2, Author.count
    
    a = Author.new( :first_name => 'test', :last_name => 'test' )
    a.save
    assert_equal 3, Author.count
  end
  
  test "Authors have Books" do
    assert_equal 2, Author.first.books.size
    assert_equal [books(:two), books(:one)], Author.first.books
  end
end
