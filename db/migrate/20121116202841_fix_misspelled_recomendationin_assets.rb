class FixMisspelledRecomendationinAssets < ActiveRecord::Migration
  def up
    rename_column :assets, :recomendation_id, :recommendation_id
  end

  def down
    rename_column :assets, :recommendation_id, :recomendation_id
    
  end
end
