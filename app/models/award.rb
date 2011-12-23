class Award < ActiveRecord::Base
    has_many :recomendations
    attr_accessible :name, :info
end
