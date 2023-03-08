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


  get 'users/profile', to: 'users#profile'
  get 'users/profile/edit'#, to: 'users/profile#edit'
  get 'users/show'
  #resources :users, only: [:show, :profile]


  post 'reservations/confirm', to: 'reservations#confirm'
  get 'reservations', to: 'reservations#index'


  resources :reservations 


  devise_scope :user do

  end
  

  root 'plans#index'

end
