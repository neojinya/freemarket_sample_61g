# deviseとは別のsign_up用のコントローラー
class SignupController < ApplicationController

  def step1
    @user = User.new

  end

  # TODO: Date.new〜以降はuserモデルに記述する必要あり 伊藤 20191116
  def step2
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:birthday] = Date.new(params[:user]["birthday(1i)"].to_i,params[:user]["birthday(2i)"].to_i,params[:user]["birthday(3i)"].to_i)
    @user = User.new
    binding.pry
  end

  def step3
    @user = User.new
  end

  def step4
    @credit = Credit.new
  end

private

def flatten_date_array hash
  %w(1 2 3).map { |e| hash["date(#{e}i)"].to_i }
end


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
