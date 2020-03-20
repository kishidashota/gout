class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters , if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_image,:user_name,:love_brand])
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_image,:user_name,:love_brand])

  end
end
