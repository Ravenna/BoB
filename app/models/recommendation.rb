class Recommendation < ActiveRecord::Base
  belongs_to :award
  belongs_to :user
  has_many :approvals, :dependent => :destroy
  accepts_nested_attributes_for :approvals, :allow_destroy => true, :reject_if => :all_blank
  attr_accessible :nominee, :award_id, :approvals_attributes, :title, :department, :summary, :accomplishments, :caption, :url, :supervisor, :upload
  validates  :nominee, :title, :department, :summary, :accomplishments, :supervisor,  :presence => true
  
  has_attached_file :upload
  has_attached_file :upload2
  has_attached_file :upload3
  validates_attachment_size :photo, :less_than => 5.megabytes
  
end
