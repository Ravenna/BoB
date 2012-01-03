class RemoveAssociateNumberFromRecommendation < ActiveRecord::Migration
  def up
    remove_column :recommendations, :associate_number
  end

  def down
    add_column :recommendations, :associate_number, :string
  end
end
