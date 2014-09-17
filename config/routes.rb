NewsReader::Application.routes.draw do
  root to: "static_pages#index"


  
  namespace :api do
    resources :feeds, only: [:index, :create, :show, :destroy] do
      resources :entries, only: [:index]
    end
    resources :user_feeds, only: [:create]
    resources :user_favorite_feeds, only: [:create, :destroy]
    resources :user_favorite_entries, only: [:create, :destroy]
  end
  
  resources :users, only: [:new, :create]
  resource :session, only: [:create, :destroy, :new]

end
