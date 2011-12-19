class AddAwardIdToRecomendation < ActiveRecord::Migration
  def change
    add_column :recomendations, :award_id, :integer
  end
end
