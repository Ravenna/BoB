class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :smt, :admin
  
   has_many :recommendations
   has_many :approvals # the approvals this user needs to approve or has approved

   after_create :send_invitation, :if => :invite?

   def self.generate_password(password)
     ::BCrypt::Password.create("#{password}#{self.pepper}", :cost => self.stretches).to_s
   end

   # everything we need to do before sending an invitation reset password link
   # if email object is provided use it's first and last name
   def invite!(email = nil)
     self.password = self.password_confirmation = "ebbob1" # update generate random password
     self.first_name = email.first_name and self.last_name = email.last_name if email.kind_of? Email
     @needs_invite = true
   end

   def invite?
     @needs_invite == true
   end

   protected

   def send_invitation
     User.find(self).send_reset_password_instructions
     
     
   end
end
