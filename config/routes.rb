Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }


  devise_scope :users do
    get "/sign_in" => "devise/sessions#new" # login/sign_inへのカスタムパス
    get "/sign_up" => "devise/registrations#new", as: "new_users_registration" # sign_up/registrationへのカスタムパス
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'plans', to: 'plans#index'

end
