class Recommendation < ActiveRecord::Base
  belongs_to :award
  belongs_to :user
  has_many :approvals, :dependent => :destroy
  accepts_nested_attributes_for :approvals, :allow_destroy => true, :reject_if => :all_blank
  attr_accessible :nominee, :award_id, :approvals_attributes, :title, :department, :summary, :accomplishments, :caption, :url, :supervisor, :upload
  validates  :nominee, :title, :department, :summary, :accomplishments, :supervisor,  :presence => true
  
  has_attached_file :upload,
    :storage => :s3,
       :bucket => 'bestofbauer',
       :s3_credentials => {
         :access_key_id => ENV['MyAccessKey'],
         :secret_access_key => ENV['MySecretKey']
       }
  has_attached_file :upload2,
    :storage => :s3,
      :bucket => 'bestofbauer',
       :s3_credentials => {
         :access_key_id => ENV['MyAccessKey'],
          :secret_access_key => ENV['MySecretKey']
       }
  has_attached_file :upload3,
    :storage => :s3,
      :bucket => 'bestofbauer',
       :s3_credentials => {
         :access_key_id => ENV['MyAccessKey'],
          :secret_access_key => ENV['MySecretKey']
       }
  
end
