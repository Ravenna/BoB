class Page < ActiveRecord::Base
  attr_accessible :name, :body
  
  extend FriendlyId
  friendly_id :name, :use => :slugged
  
end
