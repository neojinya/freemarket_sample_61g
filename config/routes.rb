Rails.application.routes.draw do
  

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions =>'users/sessions'
  }
  

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end
  root 'products#index'


  resources :products, only: [:index, :new, :create]
  resources :users, only: [:index, :show, :create, :edit, :update, :destroy]

  # 仮置き
  get '/sign_up/registration', to: "users#registration"
  get '/sign_up/registration', to: "users#registration"
  
  get '/mypage', to: "products#mypage"
  get '/mypage/profile', to: "products#profile"
  get '/mypage/credit', to: "products#credit"
  get '/mypage/users_info', to: "products#users_info"

  get '/products/show', to: "products#show"
  get '/products/buy', to: "products#buy"

  get '/logout', to: "users#destroy"

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
