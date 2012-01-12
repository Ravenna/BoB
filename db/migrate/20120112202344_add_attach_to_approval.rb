class AddAttachToApproval < ActiveRecord::Migration
    def self.up
      change_table :approvals do |t|
        t.has_attached_file :upload
      end
    end

    def self.down
      drop_attached_file :approvals, :upload
    end

end
