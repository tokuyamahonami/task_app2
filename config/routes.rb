Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :users, only: [:show]

  devise_scope :user do
    get '/sign_in', to: 'users/sessions#new'
  end

  get 'users/show'
  get 'plans', to: 'plans#index'

end
