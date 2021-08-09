Rails.application.routes.draw do
  get 'search/search'
  devise_for :users

  root to: 'homes#top'
  get 'home/about' => 'homes#about',as: 'about'

  resources :books, only: [:index, :show, :create, :edit, :destroy, :update]
  resources :users, only: [:index, :show, :create, :edit, :update]
  get '/search' => 'searches#search'
end
