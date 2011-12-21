class AddInfoToAwards < ActiveRecord::Migration
  def change
    add_column :awards, :info, :text
  end
end
