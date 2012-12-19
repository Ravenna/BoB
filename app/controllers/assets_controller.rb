class AssetsController < ApplicationController
  def destroy_asset
     @asset = Asset.find(params[:id])
     @asset.destroy

     respond_to do |format|
       format.js
     end
  end 
end