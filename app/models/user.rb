class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :smt, :admin
  
   has_many :recommendations
   has_many :approvals # the approvals this user needs to approve or has approved

   after_create :send_invitation, :only => :invite?

   # everything we need to do before sending an invitation reset password link
   def invite!
     self.password = self.password_confirmation = "ebbob1" # update generate random password
     # set the reset token with Devise
     @needs_invite = true
   end

   def invite?
     @needs_invite == true
   end

   protected

   # TODO: Tell devise to send out email
   def send_invitation
     User.find(self).send_reset_password_instructions
     
     
   end
end 