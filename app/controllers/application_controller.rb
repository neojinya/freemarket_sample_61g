class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def current_user
  #   @current_user ||= User.find_by(id: session[:id])
  # end

  # helper_method :current_user

  def after_sign_in_path_for(resource)
    root_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path(resource)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kata, :last_name_kata, :nickname, :phone_number, :post_code, :prefecture, :city_village_town, :house_number, :building, :birthday])
    devise_parameter_sanitizer.permit(:account_update, keys: [:post_code, :prefecture, :city_village_town, :house_number, :building, :image, :num_of_exhibit, :profiel_message])
  end
  
  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

end