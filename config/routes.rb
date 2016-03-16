Rails.application.routes.draw do
  root "homes#index"
  resources :homes, :about, :posts
  get "posts" => "posts#search", as: :post_search

  resources :posts do
    resources :comments, only: [:new, :create, :update, :destroy]
  end

  resources :users, only: [:new, :create, :edit, :update]
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :posts do
    resources :favourites, only: [:create, :destroy]
  end

end
