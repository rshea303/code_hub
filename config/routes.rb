Rails.application.routes.draw do
  get 'signup' => 'users#new'
  get 'users/index'

  root "resources#index"

  resource :session
  resources :users

  resources :resources do 
    resources :reviews
  end
end
