# deviseとは別のsign_up用のコントローラー
class SignupController < ApplicationController
  before_action :validates_step1, only: :step2
  before_action :validates_step2, only: :step3

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

  # 伊藤 20191116
  # TODO: Date.new〜以降はuserモデルに記述する必要あり 
  # TODO: :password_confirmationの保存方法 現状はDBに保存していない
  def validates_step1
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:birthday] = Date.new(params[:user]["birthday(1i)"].to_i,params[:user]["birthday(2i)"].to_i,params[:user]["birthday(3i)"].to_i)
    @user = User.new(
      nickname:          session[:nickname],
      email:             session[:email],
      password:          session[:password],
      birthday:          session[:birthday],

      phone_number:      "01234567891",
      last_name:         "山田",
      first_name:        "太郎",
      last_name_kata:    "ヤマダ",
      first_name_kata:   "タロウ",
      post_code:         "0123456",
      prefecture:        "東京都",
      city_village_town: "渋谷区",
      house_number:      "青山1-1-1",
      )

    render '/signup/step1' unless @user.valid?
  end

  def validates_step2
    session[:phone_number] = user_params[:phone_number]
    @user = User.new(
      nickname:          session[:nickname],
      email:             session[:email],
      password:          session[:password],
      birthday:          session[:birthday],
      phone_number:      session[:phone_number],

      last_name:         "山田",
      first_name:        "太郎",
      last_name_kata:    "ヤマダ",
      first_name_kata:   "タロウ",
      post_code:         "0123456",
      prefecture:        "東京都",
      city_village_town: "渋谷区",
      house_number:      "青山1-1-1",
      )
      
    render '/signup/step2' unless @user.valid?
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

  # 伊藤 20191116
  # TODO: 未利用。クレジットカード登録機能実装時に利用する。
  def credit_params
    params.require(:credit).permit(
      :number,        
      :expiration_date,
      :security_code, 
      :user_id
    )
  end
end
