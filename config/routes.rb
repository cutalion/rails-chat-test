Rails.application.routes.draw do
  # Root
  root "home#index"

  # User authentication
  get "login", to: "user_sessions#new"
  post "login", to: "user_sessions#create"
  delete "logout", to: "user_sessions#destroy"

  # User dashboard
  get "dashboard", to: "dashboard#index"

  # Admin namespace
  namespace :admin do
    get "login", to: "sessions#new"
    post "login", to: "sessions#create"
    delete "logout", to: "sessions#destroy"
    get "dashboard", to: "dashboard#index"
  end

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end
