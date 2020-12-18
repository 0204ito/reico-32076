Rails.application.routes.draw do
  get 'comments/index'
  devise_for :users, controllers: {registrations: 'users/registrations'}
  root to: "reicos#index"
  resources :users, only: [:edit, :update]
  resources :refriges, only: [ :index, :new, :create, :edit, :update, :destroy] do
    resources :foods,:comments, only: [ :index, :new, :create, :edit, :update, :destroy] do
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
