require 'test_helper'

class ApprovalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "has invalid email" do
    
    @approval = Approval.new :email => 'test@something.com'
    
    assert !@approval.valid?, "Email should be invalid"
    assert_equal 1, @approval.errors[:email].length
    assert_equal "is not formatted properly", @approval.errors[:email].first
    
    @approval = Approval.new :email => "tj@ravenninteractive.com"
    @approval.valid?
    @approval.errors.full_messages.each do |msg|
      puts msg
    end
    assert_equal 0, @approval.errors[:email].length
    assert @approval.errors.empty?
    assert @approval.valid?, "Should be valid approval"
  end
  
  test "has valid email" do
    
  end
  
end
