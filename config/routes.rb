Rails.application.routes.draw do
  root "tops#index"
  resources :posts, only: [:new,:create,:show] do
    resources :comments, only: :create
  end
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users
  get 'reviews/new'
  resources :users, only: :show
end
