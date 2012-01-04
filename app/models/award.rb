class Award < ActiveRecord::Base
    has_and_belongs_to_many :categories
    has_many :recomendations
    attr_accessible :name, :info, :category_ids
    
    scope :in_categories, lambda { |categories|
      joins(:categories).
      where(:awards_categories => { :category_id => categories } ).
      select("DISTINCT awards.*")
    }
    
    # Hard coding the ids for the store awards
      STORE_AWARD_IDS = [3,4,5]

      # Class method to make checking for a store award easier
      # Usage:
      #   if Award.store_award?(params[:award_id])
      #   # do something
      #   else
      #   # do other thing
      #   end
      def self.store_award?(id_or_award)
        award = id_or_award.kind_of?(Award) ? id_or_award : find_by_id(id_or_award)
        award.store_award?
      end

      # true if the award's id is in the STORE_AWARD_IDS field
      # Usage:
      #   award = Award.find(params[:id])
      #   if award.store_award?
      #   # do thing
      #   else
      #   # do other thing
      #   end
      def store_award?
        STORE_AWARD_IDS.include?(id)
      end

      # convenience method, if it's not a store award it's an award for a person
      def person_award?
        !store_award?
      end
    
end
