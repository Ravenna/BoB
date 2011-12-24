class Category < ActiveRecord::Base
  has_and_belongs_to_many :awards
  attr_accessible :name
end
