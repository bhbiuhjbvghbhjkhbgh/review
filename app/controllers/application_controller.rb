class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :date_of_birth, :sex, :is_deleted, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname, :email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile])
  end
end
