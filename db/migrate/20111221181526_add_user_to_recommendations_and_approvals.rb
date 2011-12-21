class AddUserToRecommendationsAndApprovals < ActiveRecord::Migration
  def up
    add_column :recommendations, :user_id, :integer
    add_column :approvals, :user_id, :integer
  end
  
  def down
    remove_column :recommendations, :user_id, :integer
    remove_column :approvals, :user_id, :integer
  end 
end
