Rails.application.routes.draw do
  resources :users, only: [ :new, :create, :index, :show ] do
    resources :orders, only: [ :create ]
  end

  root to: 'pages#home'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [ :index, :show, :new, :create ] do
        resources :orders, only: [ :new, :create ]
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
