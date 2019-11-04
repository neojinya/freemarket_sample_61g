Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, only: [:index, :new]

  # 仮置き
  get '/mypage', to: "products#mypage"
  get '/mypage/profile', to: "products#profile"
  get '/mypage/users_info', to: "products#users_info"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
