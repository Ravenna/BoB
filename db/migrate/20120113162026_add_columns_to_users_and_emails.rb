class AddColumnsToUsersAndEmails < ActiveRecord::Migration
  def up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    remove_column :users, :name
    add_column :emails, :first_name, :string
    add_column :emails, :last_name, :string
  end
  
  def down
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
    add_column :users, :name
    remove_column :emails, :first_name, :string
    remove_column :emails, :last_name, :string
  end 
end
