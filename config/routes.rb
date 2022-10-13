# frozen_string_literal: true

Rails.application.routes.draw do
  get '/admin/rooms' => 'admin/rooms#index', :as => :user_root
  post 'users/sign_up', to: 'signup_prohibit#create'
  get 'users/sign_up', to: 'signup_prohibit#index'

  devise_scope :user do
    get 'users/sign_in', to: 'users/sessions#new'
    post 'users/sign_in', to: 'users/sessions#create'
    get 'users/sign_out', to: 'users/sessions#destroy'
  end

  devise_for :users
  resources :rooms
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#index'
  resources :reviews
  resources :rooms
  get 'booking/new', to: 'bookings#new'
  post 'booking/new', to: 'bookings#create'

  namespace :admin do
    resources :rooms do
      member do
        get :delete_image_attachment
      end
    end
    resources :reviews
    resources :bookings
    get 'bookings_controller(.:format)', to: 'files#download'
  end
end
