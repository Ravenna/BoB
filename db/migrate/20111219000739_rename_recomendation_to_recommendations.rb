class RenameRecomendationToRecommendations < ActiveRecord::Migration
      def self.up
          rename_table :recomendations, :recommendations
      end 
      def self.down
          rename_table :recommendations, :recomendations
      end

end
