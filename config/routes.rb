Rails.application.routes.draw do
  devise_for :users
  root to: "reicos#index"
  resources :refriges, only: [ :new, :create]
end
