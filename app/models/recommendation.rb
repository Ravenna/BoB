class Recommendation < ActiveRecord::Base
  belongs_to :award
  has_many :approvals, :dependent => :destroy
  accepts_nested_attributes_for :approvals, :allow_destroy => true, :reject_if => :all_blank
  attr_accessible :nominee, :award_id, :approvals_attributes, :title, :department, :associate_number, :summary, :accomplishments, :caption, :url, :supervisor
  validates_presence_of  :department 
  
  has_attached_file :upload, :styles => { :large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }
  
end
