Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  root 'home#top'
  get 'home/about'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  resources :books do
  	resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
end