# deviseとは別のsign_up用のコントローラー
class SignupController < ApplicationController

  def step1
    @user = User.new
  end

  # 伊藤 20191116
  # TODO: Date.new〜以降はuserモデルに記述する必要あり 
  # TODO: :password_confirmationの保存方法 現状はDBに保存していない
  def step2
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:birthday] = Date.new(params[:user]["birthday(1i)"].to_i,params[:user]["birthday(2i)"].to_i,params[:user]["birthday(3i)"].to_i)
    @user = User.new
  end

  def step3
    session[:phone_number] = user_params[:phone_number]
    @user = User.new
  end

  def step4
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kata] = user_params[:last_name_kata]
    session[:first_name_kata] = user_params[:first_name_kata]
    session[:post_code] = user_params[:post_code]
    session[:prefecture] = user_params[:prefecture]
    session[:city_village_town] = user_params[:city_village_town]
    session[:house_number] = user_params[:house_number]
    session[:building] = user_params[:building]
    @credit = Credit.new
  end

  def create
    @user = User.new(
      nickname:          session[:nickname],
      email:             session[:email],
      password:          session[:password],
      last_name:         session[:last_name],
      first_name:        session[:first_name],
      last_name_kata:    session[:last_name_kata],
      first_name_kata:   session[:first_name_kata],
      phone_number:      session[:phone_number],
      post_code:         session[:post_code],
      prefecture:        session[:prefecture],
      city_village_town: session[:city_village_town],
      house_number:      session[:house_number],
      building:          session[:building],
      birthday:          session[:birthday]
    )
    binding.pry
    if @user.save
      session[:id] = @user.id
      redirect_to done_signup_index_path
    else
      render 'signup/step1'
    end
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
  end

private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,                
      :password,   
      :last_name,
      :first_name,           
      :last_name_kata,            
      :first_name_kata,          
      :phone_number,         
      :post_code,            
      :prefecture,           
      :city_village_town,    
      :house_number,         
      :building,             
      :birthday
      )
  end

  def credit_params
    params.require(:credit).permit(
      :number,        
      :expiration_date,
      :security_code, 
      :user_id
    )
  end
end
