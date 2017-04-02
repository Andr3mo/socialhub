# rubocop:disable LineLength
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def sign_up
    @provinces = Province.all
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |user| user.permit(:first_name, :last_name, :province_id, :city, :email, :password, :remember_me) }
    devise_parameter_sanitizer.permit(:sign_in) { |user| user.permit(:email, :password, :remember_me) }
    devise_parameter_sanitizer.permit(:account_update) { |user| user.permit(:first_name, :last_name, :address, :city, :country, :postal_code, :email, :password, :current_password, :remember_me) }
  end
end
