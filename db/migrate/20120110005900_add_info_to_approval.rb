class AddInfoToApproval < ActiveRecord::Migration
  def change
    add_column :approvals, :info, :text
  end
end
