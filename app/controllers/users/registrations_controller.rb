class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.

  private
    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :email, :role, :password, :password_confirmation)
    end
end
