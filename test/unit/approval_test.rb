require 'test_helper'

class ApprovalTest < ActiveSupport::TestCase

  test "has invalid email" do
    
    @approval = Approval.new :email => 'test@something.com'
    
    assert !@approval.valid?, "Email should be invalid"
    assert_equal 1, @approval.errors[:email].length
    assert_equal "must be a valid eddiebauer.com e-mail address!", @approval.errors[:email].first
    
  end
  
  test "has valid email" do
    @approval = Approval.new :email => "valid@example.com"
    @approval.valid?
    assert_equal 0, @approval.errors[:email].length
    assert @approval.errors.empty?
    assert @approval.valid?, "Should be valid approval"
    
  end
  
  test "send email when created to email field" do
    
    @approval = Approval.new :email => 'new@example.com'
    
    assert @approval.save
    last_delivery = ActionMailer::Base.deliveries.last
    
    assert last_delivery.to.include?('new@example.com')
    
  end
  
  test "create next approval" do
    
    @approval = approvals(:fake)
    @approval.next_approver_email = 'next@example.com'
    @approval.approved = true
    assert @approval.recently_approved?, "It is recently approved"
    assert @approval.recommendation
    assert @approval.recommendation.approvals
    
    assert_difference 'User.count' do
      assert @approval.save
      assert ActionMailer::Base.deliveries.last.to.include?(@approval.next_approver_email)
    end
    
    @user = User.find_by_email @approval.next_approver_email
    assert_equal 'Next', @user.first_name
    assert_equal 'Email', @user.last_name
    
  end
    
end
