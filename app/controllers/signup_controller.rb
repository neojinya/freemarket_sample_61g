# deviseとは別のsign_up用のコントローラー
class SignupController < ApplicationController

  def step1
    @user = User.new
  end

  def step2
    @user = User.new
  end

  def step3
    @user = User.new
  end

  def step4
    @credit = Credit.new
  end

private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,                
      :password,   
      :first_name,           
      :last_name,            
      :first_name_kata,      
      :last_name_kata,                    
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
