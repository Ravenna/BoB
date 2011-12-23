class AddFieldsToRecommendationAgain < ActiveRecord::Migration
  def up
    add_column :recommendations, :supervisor, :boolean
  end
  
  def down
    remove_column :recommendations, :supervisor, :boolean
  end 
end
