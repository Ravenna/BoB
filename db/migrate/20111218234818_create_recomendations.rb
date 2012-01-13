class Createrecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.string :nominee

      t.timestamps
    end
  end
end
