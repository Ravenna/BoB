class Asset < ActiveRecord::Base
  belongs_to :recomendation
  
  has_attached_file :asset,
    :storage => :s3,
       :bucket => ENV['BOBBucket'],
       :s3_credentials => {
         :access_key_id => ENV['MyAccessKey'],
         :secret_access_key => ENV['MySecretKey']
       }
  
  
end
