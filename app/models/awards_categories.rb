class AwardsCategories < ActiveRecord::Base
  belongs_to :awards
  belongs_to :categories
end
