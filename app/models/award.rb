class Award < ActiveRecord::Base
    has_and_belongs_to_many :categories
    has_many :recomendations
    attr_accessible :name, :info, :category_ids
    
    scope :in_categories, lambda { |categories|
      joins(:categories).
      where(:awards_categories => { :category_id => categories } ).
      select("DISTINCT awards.*")
    }
    
   
end
