Rails.application.routes.draw do
  devise_for :users
  root to: "reicos#index"
  resources :refiges, only: [ :new, :create]
end
