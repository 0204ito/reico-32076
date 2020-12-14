Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  root to: "reicos#index"
  resources :users, only: [:edit, :update]
  resources :refriges, only: [ :index, :new, :create, :edit, :update, :destroy] do
    resources :foods, only: [ :index, :new, :create] do
      collection  do
       get 'search'
      end
      collection  do
        get 'category'
       end
       collection  do
        get 'change'
       end
    end
  end
  get 'foods/:id', to: 'foods#checked'#特定のfoodテーブルを指定するためにid

end
