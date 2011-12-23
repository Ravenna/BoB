class AddUploadToRecommendation < ActiveRecord::Migration
  def self.up
      change_table :recommendations do |t|
        t.has_attached_file :upload
      end
    end

    def self.down
      drop_attached_file :recommendations, :upload
    end
end
