class SessionsController < Devise::SessionsController
  before_filter :determine_format
  
end