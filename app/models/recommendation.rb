class Recommendation < ActiveRecord::Base
  belongs_to :award
  has_many :approvals, :dependent => :destroy
  accepts_nested_attributes_for :approvals, :allow_destroy => true, :reject_if => :blank
  attr_accessible :nominee, :award_id, :approval
  
  
end
