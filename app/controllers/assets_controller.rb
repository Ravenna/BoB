class AssetsController < ApplicationController
  def destroy
     @asset = Asset.find(params[:id])
     @asset.destroy

     respond_to do |format|
       format.js
     end
end