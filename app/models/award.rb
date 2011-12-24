class Award < ActiveRecord::Base
    has_and_belongs_to_many :categories
    has_many :recomendations
    attr_accessible :name, :info, :category_ids
end
