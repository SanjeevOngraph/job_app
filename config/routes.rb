Rails.application.routes.draw do

  #get "static_pages/home" => "static_pages#home"
  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/new',to: 'devise/sessions#new'
  get '/show', to: 'users#show'
  get '/edit', to: 'users#edit'
  get '/job', to: 'posts#job'

  
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', 
  	password: 'secret', confirmation: 'verification', unlock: 'unblock', 
  	registration: 'register', sign_up: 'cmon_let_me_in' 
  }
  #get "posts#index"
  root 'static_pages#home'

  resources :users 

  resources :posts do
  	member do
  		get :delete
  		get :view
      get :job_email
      get :cancel_email
  	end
  end
  
end
