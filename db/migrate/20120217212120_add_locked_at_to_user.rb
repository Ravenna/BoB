class AddLockedAtToUser < ActiveRecord::Migration
  def up
    add_column :users, :locked_at, :datetime
  end
  
  def down
    remove_column :users, :locked_at 
    
  end 
end
