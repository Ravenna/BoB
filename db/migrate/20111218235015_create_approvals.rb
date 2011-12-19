class CreateApprovals < ActiveRecord::Migration
  def change
    create_table :approvals do |t|
      t.integer :recomendation_id
      t.boolean :approved
      t.string :email

      t.timestamps
    end
  end
end
