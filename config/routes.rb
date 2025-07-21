Rails.application.routes.draw do
  get "users/show"
  devise_for :users
  get "events/index"
  resources :events
  get "up" => "rails/health#show", as: :rails_health_check

  root "events#index"
end
