class Recommendation < ActiveRecord::Base
  belongs_to :award
  has_many :approvals, :dependent => :destroy
  accepts_nested_attributes_for :approvals, :allow_destroy => true, :reject_if => :all_blank
  attr_accessible :nominee, :award_id, :approvals_attributes, :title, :department, :summary, :accomplishments, :caption, :url, :supervisor, :upload
  validates  :nominee, :title, :department, :summary, :accomplishments, :supervisor,  :presence => true
  
  has_attached_file :upload, :styles => { :large => "600x600>" }
  has_attached_file :upload2, :styles => { :large => "600x600>" }
  has_attached_file :upload3, :styles => { :large => "600x600>" }
  
end
