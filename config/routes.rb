Rails.application.routes.draw do
  root to: 'top#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  get 'search', to: 'myserifs#search'
  
  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
   member do
      get :likes
    end
  end
  
  resources :myserifs, only: [:index, :new, :create, :destroy, :edit, :update, :show] do
    resources :comments, only: [:create, :destroy]
  end
  
  resources :favorites, only: [:create, :destroy]
  
end