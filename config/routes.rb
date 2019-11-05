Rails.application.routes.draw do
  devise_for :users
  root 'products#index'

  resources :products, only: [:index, :new]
  resources :users, only: [:index, :show, :create, :edit, :update]


  # 仮置き
  get '/mypage', to: "products#mypage"
  get '/mypage/profile', to: "products#profile"
  get '/sign_up/registration', to: "users#registration"
  get '/mypage/credit', to: "products#credit"
  get '/products/buy', to: "products#buy"
  get '/mypage/users_info', to: "products#users_info"
  get '/sign_up/registration', to: "users#registration"
  get '/mypage/credit', to: "products#credit"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
