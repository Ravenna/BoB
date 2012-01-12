class Approval < ActiveRecord::Base
  
  class ApproverEmailValidator < ActiveModel::EachValidator

     def validate_each(approval, attribute, value)
       approval.errors[attribute] << "must be a valid eddiebauer.com e-mail address and exist in our system" unless is_valid_email?(value)
     end

protected
     def is_valid_email?(address)
       Email.find_by_email(address)
     end

end # End Approver Validator

attr_accessible :approval, :email, :user_id, :approved, :decline, :next_approver_email, :info
attr_accessor :next_approver_email

#ASSOCIATIONS
  belongs_to :recommendation

#VALIDATIONs 
  validates :next_approver_email, :approver_email => { :if => :recently_approved? }   
#CALLBACKS   
  before_save :create_next_approval
  after_create :approval_notification


  def recently_approved?
      self.approved_changed? && self.approved?
    end

  def create_next_approval
    #logger.debug "Approval attributes hash: #{self.attributes.inspect}"
    user = User.find_by_email(self.email)
    if user.nil?
        new_user = User.new(:email => self.email, :password => "ebbob1", :password_confirmation => "ebbob1" )
        new_user.save
        next_approval = self.recommendation.approvals.build(:email => self.next_approver_email, :user_id  => User.find_by_email(next_approver_email))
        next_approval.save  if next_approver_email.present? && recently_approved?
    else
       next_approval = self.recommendation.approvals.build(:email => self.next_approver_email, :user_id  => User.find_by_email(next_approver_email))
       next_approval.save  if next_approver_email.present? && recently_approved?
    end 
  end 
private
  def approval_notification
    ApprovalMailer.needs_approval(self).deliver
  end
  
end