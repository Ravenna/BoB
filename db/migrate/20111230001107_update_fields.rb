class UpdateFields < ActiveRecord::Migration
  def up
    remove_column :recommendations, :decline
    add_column :approvals, :decline, :boolean
  
  
  end

  def down
    remove_column :approvals, :decline
    remove_column :approvals, :next_approver_email
  end
end
