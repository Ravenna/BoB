class Approval < ActiveRecord::Base
  class ApproverEmailValidator < ActiveModel::EachValidator

     def validate_each(approval, attribute, value)
       approval.errors[attribute] << "must be a valid e-mail address in our system" unless is_valid_email?(value)
     end

protected
     def is_valid_email?(address)
       User.find_by_email(address)
     end

  end # End Validator
  
  belongs_to :recommendation
  
  validates :next_approver_email, :approver_email => { :if => :recently_approved? }
  before_save :create_next_approval
  after_create :approval_notification
  

  attr_accessor :next_approver_email
 
  def recently_approved?
      self.approved_changed? && self.approved?
    end

    def create_next_approval
      next_approval = self.recommendation.approvals.build(:email => self.next_approver_email, :user_id  => User.find_by_email(next_approver_email))
      next_approval.save  if next_approver_email.present? && recently_approved? 
    end  

private
  def approval_notification
    ApprovalMailer.needs_approval(self).deliver
  end 
end




