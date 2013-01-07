class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  #unless Rails.application.config.consider_all_requests_local
    rescue_from Exception,
                :with => :render_error
    rescue_from ActiveRecord::RecordNotFound,
                :with => :render_not_found
    rescue_from ActionController::RoutingError,
                :with => :render_not_found
    rescue_from ActionController::UnknownController,
                :with => :render_not_found
    rescue_from ActionController::UnknownAction,
                :with => :render_not_found
  #end
  
 
  
  
  
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
  

  def determine_format
    request.format = :html if request.format == :mobile
  end
  
  before_filter :set_request_format

  def set_request_format
    if mobile? 
      if (devise_controller?)
        request.format = :html
      else
        request.format = :html
      end
    end
  end
  
  
  before_filter :prepare_for_mobile
  private  
  def mobile?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end


  def prepare_for_mobile
    session[:mobile_param] = params[:mobile] if params[:mobile]
    request.format = :mobile if mobile?
  end

  helper_method :mobile?
  
  protected
  def render_not_found(exception)
     render :status => 404, error: 'There was an error on the Page you were trying to access. The site administrator has been notified.'
   end

   def render_error(exception)
     ExceptionNotifier::Notifier
       .exception_notification(request.env, exception)
       .deliver
     #render :status => 500
     redirect_to root_path, error: 'The Page you were looking for does not exist.'
   end
  
end