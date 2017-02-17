Rails.application.routes.draw do

  devise_for :users
  root 'welcome#index'

  namespace :account do
   resources :orders
 end

  namespace :admin do
    resources :products
    resources :services
    resources :categories
  end

  resources :products do
    member do
      post :add_to_cart
    end
    resources :reviews
  end
  resources :services do
    resources :comments
  end
  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :cart_items
  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
