class Recommendation < ActiveRecord::Base
  belongs_to :award
  belongs_to :user
  has_many :approvals, :dependent => :destroy
  has_many :assets
  accepts_nested_attributes_for :approvals, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :assets, :allow_destroy => true
  attr_accessible :nominee, :award_id, :approvals_attributes, :title, :department, :summary, :accomplishments, :caption, :url, :supervisor, :assets_attributes
  validates  :nominee, :title, :department, :summary, :accomplishments, :supervisor,  :presence => true
  
  
  
end
