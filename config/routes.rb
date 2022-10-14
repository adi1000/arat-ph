Rails.application.routes.draw do
  devise_for :users do
    member { get :confirm_email }
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :products do
    collection { post "search" }
  end

  resources :suppliers do
    resources :products
    resources :amenities
    resources :packages
  end

  resources :tourist_spots

  resources :package_orders
  # Defines the root path route ("/")
  root "suppliers#index"
end
