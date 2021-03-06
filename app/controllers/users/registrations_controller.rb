# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   if params[:user][:password] == "" #sns登録なら
  #     params[:user][:password] = "Devise.friendly_token.first(7)" #deviseのパスワード自動生成機能を使用
  #     super
      
  #     sns = SnsCredential.update(user_id:  @user.id)
  #   else #email登録なら
      
  #     super
  #   end
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   new_card_path(current_user)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   new_card_path(current_user)
  # end

  # password = Devise.friendly_token.first(7)
  # if session[:provider].present? && session[:uid].present?
  #   @user = User.create(nickname:[:nickname], email: [:email], password: "password",  first_name_kata: [:first_name_kata],last_name_kata: [:last_name_kata], first_name: [:first_name], last_name: [:last_name], birthday: [:birthday], phone_number: [:phone_number])
  #   sns = SnsCredential.create(user_id: @user.id,uid: [:uid], provider: [:provider])
  # else
  #   @user = User.create(nickname:[:nickname], email: [:email], password: "password",  first_name_kata: [:first_name_kata],last_name_kata: [:last_name_kata], first_name: [:first_name], last_name: [:last_name], birthday: [:birthday], phone_number: [:phone_number])
  # end

  # password = Devise.friendly_token.first(7)
  # if session[:provider].present? && session[:uid].present?
  #   @user = User.create(nickname:session[:nickname], email: session[:email], password: "password",  first_name_kata: session[:first_name_kata],last_name_kata: session[:last_name_kata], first_name: session[:first_name], last_name: session[:last_name], birthday: session[:birthday], phone_number: params[:phone_number])
  #   sns = SnsCredential.create(user_id: @user.id,uid: session[:uid], provider: session[:provider])
  # else
  #   @user = User.create(nickname:session[:nickname], email: session[:email], password: "password",  first_name_kata: session[:first_name_kata],last_name_kata: session[:last_name_kata], first_name: session[:first_name], last_name: session[:last_name], birthday: session[:birthday], phone_number: params[:phone_number])
  # end
end
