module PasswordsHelper

  def resource_name
      :user
    end

    def resource
      @resource = session[:password] || User.new
    end

    def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
    end


  
end
