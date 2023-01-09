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

  resources :reservations, only: [:index, :create] 

  post 'reservations/confirm', to: 'reservations#confirm'
  post 'reservations/complete', to: 'reservations#complete'
  #get 'reservations/complete'



  


  devise_scope :user do

  end
  

  get 'users/show'
  root 'plans#index'

end
