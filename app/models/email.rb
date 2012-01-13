class Email < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name
  require 'csv'
   def self.import_emails
     CSV.foreach('public/emails-list.csv') do |row|
         record = Email.new(
            :last_name => row[0],
             :first_name => row[1],
             
              :email   => row[2]
         )
         record.save!  
     end
   end
  
end
