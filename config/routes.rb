Rails.application.routes.draw do
  post "moderators/sign_up", to: "signup_prohibit#create"
  get "moderators/sign_up", to: "signup_prohibit#index"
  devise_for :moderators
  post "administrators/sign_up", to: "signup_prohibit#create"
  get "administrators/sign_up", to: "signup_prohibit#index"
  devise_for :administrators
  resources :rooms
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"
  resources :reviews
  resources :rooms
  post "booking", to: "bookings#create"

  namespace :admin do
    resources :rooms
    resources :reviews
    resources :bookings
  end
end
