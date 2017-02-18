Rails.application.routes.draw do

  devise_for :users
  root 'welcome#index'

  namespace :account do
   resources :orders
   resources :appointments do
     member do
       post :apply_to_cancel
     end
   end
 end

  namespace :admin do
    resources :products
    resources :services
    resources :categories
    resources :appointments do
      member do
        post :deal
        post :confirm
        post :cancel
      end
    end
  end

  resources :products do
    member do
      post :add_to_cart
    end
    resources :reviews
  end
  resources :services do
    resources :comments
    resources :appointments
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
