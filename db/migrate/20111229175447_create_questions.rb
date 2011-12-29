class CreateQuestions < ActiveRecord::Migration
  def up
      add_column :questions, :name, :string
      add_column :questions, :email, :string
      add_column :questions, :question, :text
  end
  
  def down
    remove_column :questions, :name, :string
    remove_column :questions, :email, :string
    remove_column :questions, :question, :text
  end 
end
