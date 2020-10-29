Rails.application.routes.draw do
  root to: 'top#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  #delete 'destroy_user', to: 'users#destroy'
  
  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  
  resources :myserifs, only: [:index, :new, :create, :destroy, :edit, :update, :show] do
    member do
      get :genre_id
    end
  end
end