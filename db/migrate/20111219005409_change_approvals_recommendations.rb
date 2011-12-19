class ChangeApprovalsRecommendations < ActiveRecord::Migration
  def up
    rename_column :approvals, :recomendation_id, :recommendation_id
  end

  def down
    rename_column :approvals, :recommendation_id, :recomendation_id,
  end
end
