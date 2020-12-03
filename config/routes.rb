Rails.application.routes.draw do
  devise_for :users
  root to: "reicos#index"
  resources :refriges, only: [ :index, :new, :create] do
    resources :foods, only: [ :index, :new, :create]
  end
end
