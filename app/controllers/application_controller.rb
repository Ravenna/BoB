class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def user_is_admin
    unless current_user.admin
       redirect_to root_url, notice: "You do not have sufficient privileges to review that Recommendation!"
     end
  end 
  
  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
      if resource.is_a?(User) 
        root_url
      else
        root_url
        flash[:notice] = "You must signup before loggin in!"
      end
  end
  
  def inbox_value
    if current_user
     @approval_value = Approval.where(:email => current_user.email , :approved => nil)
    end 
  end 
  
  def if_recommendations
    if current_user
     @my_recs = Recommendation.where(:user_id => current_user.id)
    end 
  end
  

  
end