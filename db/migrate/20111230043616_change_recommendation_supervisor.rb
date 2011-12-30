class ChangeRecommendationSupervisor < ActiveRecord::Migration
  def up
    change_table :recommendations do |t|
          t.change :supervisor, :string
    end
  end

  def down
    change_table :recommendations do |t|
          t.change :supervisor, :boolean
    end
  end
end
