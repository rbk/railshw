require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "Categories Exist" do
    assert_equal 2, Category.count
  end
  
  test "Categories Validations" do
    c = Category.new 
    c.save
    assert_equal 2, Category.count
    
    c = Category.new :name => 'test'
    c.save
    assert_equal 3, Category.count
  end
  
  test "Some Categories Don't have Parents" do
    assert_nil categories(:one).parent_category
  end
  
  test "Some Categories have Parents" do
    assert_equal categories(:one), categories(:two).parent_category
  end
  
  test "Some Categories have Sub-Categories" do
    assert_equal 1, categories(:one).sub_categories.size
  end
  
  test "Categories have Books" do
    # assert_equal [books(:two),books(:one)], categories(:two).books
    assert_equal 2, categories(:two).books.size
  end
end
