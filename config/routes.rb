Rails.application.routes.draw do

  resources :rooms
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  resources :users, only: [:show]

  resources :rooms, only: [:index, :new, :create] do
    collection do
      get 'search'
    end
  end

  resources :reservations, only: [:new, :confirm, :complete, :show, :create] 


  devise_scope :user do

  end
  

  #get 'reservations/new'
  #post 'reservations/confirm'
  #post 'reservations/back'
  #post 'reservations/complete'

  get 'users/show'
  root 'plans#index'

end
