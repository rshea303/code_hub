Rails.application.routes.draw do
  get 'reviews/index'

  root "resources#index"

  resources :resources do 
    resources :reviews
  end
end
