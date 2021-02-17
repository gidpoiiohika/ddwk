class ApplicationController < ActionController::Base
  before_action :configure_devise_permitted_parameters, if: :devise_controller?  

  protected

  def configure_devise_permitted_parameters
    registration_params = [ :first_name, :last_name, :role, :email, :password, :password_confirmation ]

    if params[:action] == 'update'
      devise_parameter_sanitizer.permit(:account_update) {
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.permit(:sign_up) {
        |u| u.permit(registration_params)
      }
    end
  end

  def after_sign_in_path_for(resource)
    if current_user.role == "admin"
      admin_root_path
    else
      root_path
    end
  end
end
