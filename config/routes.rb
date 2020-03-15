Rails.application.routes.draw do
  devise_for :users
  get 'reviews/new'
  root "tops#index"
  resources :posts, only: [ :new, :create, :show]
  resources :users, only: :show
end
