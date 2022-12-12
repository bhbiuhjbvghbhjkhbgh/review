Rails.application.routes.draw do
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }
  resource :books
  resource :posts
  get 'books' => 'books#index', as: 'index'
  root to: 'books#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
