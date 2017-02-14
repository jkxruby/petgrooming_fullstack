Rails.application.routes.draw do

  devise_for :users
  root 'welcome#index'

  namespace :admin do
    resources :products
    resources :services
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end
  resources :services
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
