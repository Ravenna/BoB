class CreateRecomendations < ActiveRecord::Migration
  def change
    create_table :recomendations do |t|
      t.string :nominee

      t.timestamps
    end
  end
end
