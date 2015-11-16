Rails.application.routes.draw do
  root 'static_pages#home'
  get 'login' => 'sessions#new'
  get 'signup' => 'users#new'

  resources :users do
    member do
      get 'bookmarks'
    end
  end
  resources :bookmarks
  resources :sessions
end
