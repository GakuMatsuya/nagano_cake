class ApplicationController < ActionController::Base
  
  def after_sign_in_path_for(resource)
    admin_path
  end
  
  protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
end

end
