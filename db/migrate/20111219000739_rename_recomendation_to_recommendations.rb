class RenameRecomendationToRecommendations < ActiveRecord::Migration
      def self.up
          rename_table :recommendations, :recommendations
      end 
      def self.down
          rename_table :recommendations, :recommendations
      end

end
