Rails.application.routes.draw do
  get 'users/index'

  root "resources#index"

  resources :users

  resources :resources do 
    resources :reviews
  end
end
