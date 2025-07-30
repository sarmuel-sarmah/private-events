Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :event_attendings, only: [ :create, :destroy ]
  resources :events
  get "up" => "rails/health#show", as: :rails_health_check

  root "events#index"
end
