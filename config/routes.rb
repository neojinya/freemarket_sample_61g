Rails.application.routes.draw do
  


  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end

  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4' 
      get 'done'
    end
  end

  resources :products, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :create, :edit, :update, :destroy]
  root 'products#index'
  get '/products/:id/buy', to: "products#buy"

  # 仮置き
  get '/sign_up/registration', to: "users#registration"
  get '/sign_up/registration', to: "users#registration"
  
  get '/mypage', to: "products#mypage"
  get '/mypage/profile', to: "products#profile"
  get '/mypage/users_info', to: "products#users_info"
  get '/mypage/listing', to: "products#listing"
  get '/mypage/:id/showing', to: "products#showing"

  resources :cards, only: [:new, :show, :create] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
