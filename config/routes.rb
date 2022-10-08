Rails.application.routes.draw do
  devise_for :users do
    member do
      get :confirm_email
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :products do
    collection do
      post 'search'
    end
  end

  resources :suppliers do
    resources :products
    resources :amenities
    resources :packages
  end


  # Defines the root path route ("/")
  root "suppliers#index"
end
