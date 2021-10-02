Rails.application.routes.draw do
  devise_for :users
  root to: 'gardens#index'
  resources :gardens, only: [:new, :show, :create]
  get "about_us", to: "pages#about_us"
  #get '/post', to: 'pages#register'
  #get '/reservations', to: 'pages#reservations'
  #get '/dashboard', to: 'pages#dashboard'
  #post '/submit', to: 'pages#submit'

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
