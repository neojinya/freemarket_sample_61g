Rails.application.routes.draw do
  

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions =>'users/sessions'
  }
  
  # get 'users/login'
  # post "login" => "users#login"


  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end
  root 'products#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
