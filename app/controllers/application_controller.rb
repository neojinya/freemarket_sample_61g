class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    root_path(resource)
  end

  def after_sign_out_path_for(resource)
    'users/sign_out'
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kata, :last_name_kata, :nickname, :phone_number, :num_of_exihibits, :post_code, :prefecture, :city_village_town, :house_number, :building, :birthday])
  end
end
