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


  post 'reservations/confirm'
  post 'reservations/complete'

  resources :reservations


  devise_scope :user do

  end
  

  get 'users/show'
  root 'plans#index'

end
