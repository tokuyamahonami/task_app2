Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :users, only: [:show]

  devise_scope :users do
    get "user/:id", :to => "users/registrations#detail"
    get "users/sign_up" => "registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end
  
  get 'plans', to: 'plans#index'

end
