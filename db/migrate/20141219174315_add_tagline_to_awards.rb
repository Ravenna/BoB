class AddTaglineToAwards < ActiveRecord::Migration
  def change
    add_column :awards, :tagline, :string
  end
end
