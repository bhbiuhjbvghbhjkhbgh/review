Rails.application.routes.draw do

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }
  resources :books
  resources :posts
  resources :users
  get 'books' => 'books#index', as: 'index'
  patch 'users/:id' => 'users#update', as: 'update'
  root to: 'books#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
