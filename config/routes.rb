Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :event_attendings, only: [ :new, :create ]
  resources :events
  get "up" => "rails/health#show", as: :rails_health_check

  root "events#index"
end
