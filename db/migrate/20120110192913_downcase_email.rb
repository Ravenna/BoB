class DowncaseEmail < ActiveRecord::Migration
  def self.up
    Email.all.each do |email|
      email.update_attributes :email => email.email.downcase
    end
  end
end
