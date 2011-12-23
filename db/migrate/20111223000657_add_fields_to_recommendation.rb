class AddFieldsToRecommendation < ActiveRecord::Migration
  def up
    add_column :recommendations, :associate_number, :integer
    add_column :recommendations, :department, :string
    add_column :recommendations, :title, :string
    add_column :recommendations, :summary, :text
    add_column :recommendations, :accomplishments, :text
  end
  
  def down
    remove_column :recommendations, :associate_number, :integer
    remove_column :recommendations, :department, :string
    remove_column :recommendations, :title, :string
    remove_column :recommendations, :summary, :text
    remove_column :recommendations, :accomplishments, :text
  end 
end
