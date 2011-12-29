class CreateQuestions < ActiveRecord::Migration
  def up
      create_table :questions
      add_column :questions, :name, :string
      add_column :questions, :email, :string
      add_column :questions, :question, :text
  end
  
  def down
    drop_table :questions
    remove_column :questions, :name, :string
    remove_column :questions, :email, :string
    remove_column :questions, :question, :text
  end 
end
