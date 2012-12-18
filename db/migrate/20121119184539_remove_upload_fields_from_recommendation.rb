class RemoveUploadFieldsFromRecommendation < ActiveRecord::Migration
  def up
    remove_column :recommendations, :upload_file_name
    remove_column :recommendations, :upload_content_type
    remove_column :recommendations, :upload_file_size
    remove_column :recommendations, :upload_updated_at
    remove_column :recommendations, :upload2_file_name
    remove_column :recommendations, :upload2_content_type
    remove_column :recommendations, :upload2_file_size
    remove_column :recommendations, :upload2_updated_at
    remove_column :recommendations, :upload3_file_name
    remove_column :recommendations, :upload3_content_type
    remove_column :recommendations, :upload3_file_size
    remove_column :recommendations, :upload3_updated_at
  end

  def down
  end
end
