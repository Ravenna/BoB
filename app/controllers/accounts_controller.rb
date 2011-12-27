class AccountsController < ApplicationController
  
  def edit
    @account = User.find(params[:id])
  end 
  def update
     @account = User.find(params[:id])
     params[:user].delete(:password) if params[:user][:password].blank?
     params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
     if @account.update_attributes(params[:user])
       flash[:notice] = "Successfully updated User."
       redirect_to accounts_list_path
     else
       render :action => 'edit'
     end
   end
end
