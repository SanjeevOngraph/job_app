Rails.application.routes.draw do
  #get "static_pages/home" => "static_pages#home"
  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/new',to: 'devise/sessions#new'
  get '/show', to: 'users#show'
  get 'users/index'
  #get 'static_pages/help'
  #devise_for :users
  
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', 
  	password: 'secret', confirmation: 'verification', unlock: 'unblock', 
  	registration: 'register', sign_up: 'cmon_let_me_in' 
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  #get '/static_pages/home' => 'new_user_registration_path'
  #root  'home#index'
  resources :users

  
  #get 'devise/registrations#destroy'
end
