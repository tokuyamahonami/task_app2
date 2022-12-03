Rails.application.routes.draw do

  resources :rooms do
    collection do
      get 'search'
    end
  end

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  resources :users, only: [:show]

  #resources :reservations, only: [:show, :confirm, :complete]


  devise_scope :user do

  end
  

  get 'reservations/show'
  post 'reservations/confirm'
  #post 'reservations/back'
  post 'reservations/complete'

  get 'users/show'
  root 'plans#index'

end
