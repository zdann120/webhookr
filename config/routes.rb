require 'sidekiq/web'

Rails.application.routes.draw do
  resources :data_sets do
    post '/incoming/:uid', to: 'data_sets/incoming_requests#create', on: :collection,
        only: :create, as: 'incoming_hook'
    get 'request/:uid', on: :member, to: 'data_sets/incoming_requests#show', as: 'view_hook'
  end
  namespace :admin do
      resources :users
      resources :announcements
      resources :notifications
      resources :services

      root to: "users#index"
    end
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
