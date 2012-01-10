class Email < ActiveRecord::Base
  attr_accessible :email
  require 'csv'
   def self.import_emails
     CSV.foreach('public/users-emails.csv') do |row|
         record = Email.new(
             :email   => row[0]
         )
         record.save!  
     end
   end
  
end
