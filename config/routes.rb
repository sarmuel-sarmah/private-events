Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions"
  }
  resources :events
  get "up" => "rails/health#show", as: :rails_health_check

  root "events#index"
end
