require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "populate user model when inviting" do
    
    @email = emails(:next)
    @user = User.new :email => @email.email
    
    @user.invite!(@email)
    
    assert_equal 'Next', @user.first_name
    assert_equal 'Email', @user.last_name
    
    
  end
  
end
