require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "create user" do
    assert_equal 1, User.count
    
    # no username
    u = User.new( :email => 'test@test.com', :first_name => 'test', :last_name => 'test', :password => 'testtest' )
    assert_equal false, u.save
    
    #dup username
    u = User.new( :username => 'noahsinger', :email => 'test@test.com', :first_name => 'test', :last_name => 'test', :password => 'testtest' )
    assert_equal false, u.save
    
    #no email
    u = User.new( :username => 'testuser', :first_name => 'test', :last_name => 'test', :password => 'testtest' )
    assert_equal false, u.save
    
    #invalid email
    u = User.new( :username => 'testuser', :email => 'test.com', :first_name => 'test', :last_name => 'test', :password => 'testtest' )
    assert_equal false, u.save
    
    #no first_name
    u = User.new( :username => 'testuser', :email => 'test@test.com', :last_name => 'test', :password => 'testtest' )
    assert_equal false, u.save
    
    #no last_name
    u = User.new( :username => 'testuser', :email => 'test@test.com', :first_name => 'test', :password => 'testtest' )
    assert_equal false, u.save
    
    #no password
    u = User.new( :username => 'testuser', :email => 'test@test.com', :first_name => 'test', :last_name => 'test' )
    assert_equal false, u.save
  end
  
  test "password not revealed" do
    assert_equal 'xxxxxxxxx', users(:one).password
    
    u = User.create( :username => 'testuser', :email => 'test@test.com', :first_name => 'test', :last_name => 'test' )
    assert_equal '', u.password
  end
  
  test "password= assigns hash" do
    users(:one).password = "testtest"
    assert_not_nil users(:one).password_salt
    assert_equal Digest::SHA256.hexdigest("testtest"+users(:one).password_salt), users(:one).password_hash
  end
  
  test "find all verified" do
    u = User.create( :username => 'testuser', :email => 'test@test.com', :first_name => 'test', :last_name => 'test', :password => 'testtest' )
    users(:one).verify! users(:one).confirmation_code
    
    users = User.verified
    assert_equal( 1, users.size )
    
    u.verify! u.confirmation_code
    
    users = User.verified
    assert_equal( 2, users.size )
  end
  
  test "user authenticated" do
    u = User.authenticate( "noahsinger", "password" )
    assert_equal users(:one), u

    assert_raise RuntimeError do
      User.authenticate( "basusername", "password" )
    end

    assert_raise RuntimeError do
      User.authenticate( "noahsinger", "testtest" )
    end
  end
  
  test "codes are generated" do
    users(:one).generate_codes!
    assert_equal Digest::SHA256.hexdigest(users(:one).email + users(:one).id.to_s), users(:one).confirmation_code
    assert_equal Digest::SHA256.hexdigest(users(:one).username + users(:one).email + users(:one).id.to_s), users(:one).cancelation_code
  end
  
  test "verify user" do
    assert_equal true, users(:one).verify!( users(:one).confirmation_code )
    assert_equal false, users(:one).verify!( "dshdkjahdksahdkasdy8dsahnensd82dnskndlk" )
  end
  
  test "cancel user" do
    assert_equal false, User.cancel!( users(:one), "hdjnfcjh8923hr3od8od801fenf80d1" )
    assert_equal true, User.cancel!( users(:one), users(:one).cancelation_code )
    assert_raise ActiveRecord::RecordNotFound do
      User.find 1
    end
  end
end
