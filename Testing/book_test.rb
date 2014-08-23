require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "Books Exist" do
    assert_equal 3, Book.count
  end
  
  test "Book Validations" do
    b = Book.new :title => 'test'
    b.save
    assert_equal 3, Book.count
    
    b = Book.new :isbn => '000000000'
    b.save
    assert_equal 3, Book.count
    
    b = Book.new :title => 'test', :isbn => '000000000'
    b.save
    assert_equal 4, Book.count
  end
  
  test "Uncategorized Books" do
    assert_equal 1, Book.uncategorized.size
  end
  
  test "Categorized Books" do
    assert_equal 2, categories(:two).books.size
  end
  
  test "Books have Authors" do
    assert_equal 2, books(:one).authors.size
    assert_equal 1, books(:two).authors.size
  end
  
  test "Books have Publishers" do
    assert_equal publishers(:one), books(:one).publisher
    assert_equal publishers(:two), books(:two).publisher
  end
    
  test "Ebooks Exist" do
    assert_equal 1, Ebook.count
  end
  
  test "Pbook Exists" do
    assert_equal 2, Pbook.count
  end
  
  test "Ebooks Must have download_size" do
    e = Ebook.new :title => 'test', :isbn => 'test'
    e.save
    assert_equal 1, Ebook.count
    
    e = Ebook.new :title => 'test', :isbn => 'test', :download_size => 1234567
    e.save
    assert_equal 2, Ebook.count
  end
  
  test "Pbooks Must have weight" do
    p = Pbook.new :title => 'test', :isbn => 'test'
    p.save
    assert_equal 2, Pbook.count
    
    p = Pbook.new :title => 'test', :isbn => 'test', :weight => 123
    p.save
    assert_equal 3, Pbook.count
  end
  
end
