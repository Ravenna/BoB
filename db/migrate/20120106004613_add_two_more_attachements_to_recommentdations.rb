class AddTwoMoreAttachementsToRecommentdations < ActiveRecord::Migration
  def self.up
      change_table :recommendations do |t|
        t.has_attached_file :upload2
         t.has_attached_file :upload3
      end
    end

    def self.down
      drop_attached_file :recommendations, :upload2
      drop_attached_file :recommendations, :upload3
    end
end
