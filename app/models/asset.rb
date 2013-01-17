class Asset < ActiveRecord::Base
  belongs_to :recommendation
  
  has_attached_file :asset,
    :path             => ":id/:filename",
    :storage          => :fog,
       :fog_directory    => 'bestofbauer',
       :fog_public       => true,
       :fog_credentials  => {
         :provider           => 'Rackspace',
         :rackspace_username => 'eddiebauer',
         :rackspace_api_key  => ' f50bcf8a4533d44b5af848dd99d7e3d8'
       }
  
       
end
