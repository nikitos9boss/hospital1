Rails.application.routes.draw do
  get 'home/index'
  get '/index', to: 'home#index'
  get '/', to: 'home#index'
  devise_for :users
  resources :card_pacients
  resources :doctors
  resources :pacients
  resources :specials
  resources :otdelenies
  resources :clinics
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
end
