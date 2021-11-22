Rails.application.routes.draw do
  root to: "home#index"

  resources :control_devices
  resources :accounts
end
