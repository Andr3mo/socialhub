# rubocop:disable LineLength
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :account_update, if: :devise_controller?

  def account_update
    @provinces = Province.all
  end

  def after_sign_in_path_for(_resource)
    current_user
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |user| user.permit(:first_name, :last_name, :province_id, :city, :email, :password, :remember_me) }
    devise_parameter_sanitizer.permit(:sign_in) { |user| user.permit(:email, :password, :remember_me) }
    devise_parameter_sanitizer.permit(:account_update) { |user| user.permit(:first_name, :last_name, :province_id, :address, :city, :country, :postal_code, :email, :password, :current_password, :remember_me) }
  end
end
