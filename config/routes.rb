Rails.application.routes.draw do

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions',
    shared: 'user/shared/links'
  }
  resources :books
  resources :posts
  resources :users
  get 'books' => 'books#index', as: 'index'
  patch 'users/:id' => 'users#update', as: 'update'
  post 'books' => 'books#create', as: 'creater'
  delete 'bookmarks/:book_isbn' => 'books#destroy', as: 'deleter'
  post 'bookmarks/:book_isbn' => 'books#bookmark', as: 'bookmark'
  root to: 'books#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
