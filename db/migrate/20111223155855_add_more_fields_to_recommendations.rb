class AddMoreFieldsToRecommendations < ActiveRecord::Migration
  def up
    add_column :recommendations, :url, :string
    add_column :recommendations, :caption, :string
  end
end
