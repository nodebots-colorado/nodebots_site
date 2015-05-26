Rails.application.routes.draw do

  root 'pages#index'

  match 'organizers', to: 'pages#organizers',       via: 'get'
  match 'admin',      to: 'admin/organizers#index', via: 'get'
  
  get 'signout', to: 'sessions#destroy'
  get "/auth/:provider/callback", to: "sessions#create"

  resources :sessions,  only: [:create, :destroy]
  resources :resources, only: [:index, :show]

  resources :checkouts do
    collection do
      get :payment
    end
  end

  resources :events, only: [:index, :show, :new, :create, :edit, :destroy] do
    member do
      post :add_attendee
    end
  end

  resources :pages, only: [:index] do
    collection do
      get :organizers
    end
  end

  namespace :admin do
    resources :organizers, only: [:index]
  end

end
