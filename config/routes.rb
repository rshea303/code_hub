Rails.application.routes.draw do
  get 'signup' => 'users#new'
  get 'sign_in' => 'sessions#new'

  root "resources#index"

  resource :session
  resources :users

  resources :resources do 
    resources :reviews
    resources :favorites
  end
end
