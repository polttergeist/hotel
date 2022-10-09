Rails.application.routes.draw do
  get '/admin/rooms' => "admin/rooms#index", :as => :user_root
  post "users/sign_up", to: "signup_prohibit#create"
  get "users/sign_up", to: "signup_prohibit#index"

  devise_scope :user do
    get "users/sign_out", to: "devise/sessions#destroy"
  end

  devise_for :users
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
    get 'bookings_controller(.:format)', to: 'files#download'
  end
end
