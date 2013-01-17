class Asset < ActiveRecord::Base
  belongs_to :recommendation
  
  has_attached_file :asset,
    :path             => ":id/:filename",
    :storage          => :fog,
       :fog_directory    => 'bestofbauer',
       :fog_public       => true,
       :fog_credentials  => {
         :provider           => 'Rackspace',
         :rackspace_username => ENV['RACK_USER'],
         :rackspace_api_key  => ENV['CLOUD_API']
       }
  
       
end
