class AddDeclineToRecommendation < ActiveRecord::Migration
  def change
    add_column :recommendations, :decline, :boolean, :default => false
  end
end
