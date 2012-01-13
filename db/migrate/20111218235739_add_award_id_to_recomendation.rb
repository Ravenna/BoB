class AddAwardIdToRecomendation < ActiveRecord::Migration
  def change
    add_column :recommendations, :award_id, :integer
  end
end
