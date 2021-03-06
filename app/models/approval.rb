class Approval < ActiveRecord::Base
  
  class ApproverEmailValidator < ActiveModel::EachValidator

     def validate_each(approval, attribute, value)
       approval.errors[attribute] << "must be a valid e-mail address!" unless is_valid_email?(value)
     end

    protected
         def is_valid_email?(address)
           email_regex = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
           (address =~ email_regex)
           #true
         end

   end # End Approver Validator
   
   
attr_accessible :approval, :email, :user_id, :approved, :decline, :next_approver_email, :info, :upload
attr_accessor :next_approver_email

has_attached_file :upload

#ASSOCIATIONS
  belongs_to :user
  belongs_to :recommendation


#VALIDATIONS 
  validates :next_approver_email, :approver_email => { :if => :recently_approved? } 
  validates :email, :approver_email => true
  
#CALLBACKS 
  before_create :associate_correct_user
  before_save :create_next_approval, :if => :recently_approved?
  after_create :approval_notification
 
 
  
 
  def recently_approved?
     self.approved_changed? && self.approved?
  end 

  def recommendation_present?
    recommendation.present?
  end

  
  
  def create_next_approval
    logger.debug "Approval attributes hash: #{self.attributes.inspect}"
    next_approval = self.recommendation.approvals.build(:email => self.next_approver_email)
    next_approval.save  if next_approver_email.present? && recently_approved?
  end 
  
private

  def approval_notification
    ApprovalMailer.needs_approval(self).deliver
  end
  
  def associate_correct_user
    new_user = User.find_or_create_by_email self.email do |u|
        u.invite!(Email.find_by_email(self.email))
    end
    
    self.user = user
    
  end
  
end
