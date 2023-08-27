Rails.application.routes.draw do
  resources :comments do
    member do
      post 'like'
      post 'dislike'
    end
    resources :likes, only: [:create, :destroy]
  end

  resources :aventures do
    resources :comments
  end

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "aventures#index"
end
