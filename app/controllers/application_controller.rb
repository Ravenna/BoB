class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def user_is_admin
    unless current_user.admin
       redirect_to root_url, notice: "You do not have sufficient privileges to review that Recommendation!"
     end
  end 
end