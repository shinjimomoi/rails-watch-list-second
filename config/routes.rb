Rails.application.routes.draw do
  root to: "lists#index"
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create]
  end

  resources :bookmarks, only: :destroy
  resources :lists, only: :destroy
end

# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
# Defines the root path route ("/")
# root "articles#index"
