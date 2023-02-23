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


  post 'reservations/confirm', to: 'reservations#confirm'
  #post 'reservations', to: 'reservations#create'
  get 'reservations', to: 'reservations#index'


  resources :reservations #do
     #collection do
      #get 'index'
      #post 'index'
     #end
     #member do
      #post 'confirm', to: 'reservations#confirm'
      #post 'create'
      #get 'index'
     #end
  #end

  #post 'reservations/confirm', to: 'reservations#confirm'
  #post 'reservations', to: 'reservations#create'
  #get 'reservations', to: 'reservations#index'
  #post 'reservations/complete/:id', to: 'reservations#complete'
  #get 'reservations/complete'



  


  devise_scope :user do

  end
  

  get 'users/show'
  root 'plans#index'

end
