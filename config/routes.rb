Rails.application.routes.draw do
  root "tops#index"
  resources :posts, only: [ :new, :create, :show, :edit, :update, :destroy,:index] do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users
  get 'reviews/new'
  resources :users, only: [:index, :show]
end
