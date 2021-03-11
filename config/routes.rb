Rails.application.routes.draw do
  get 'user_follows/destroy'
  get 'user_follows/create'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "users/registrations" }
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show) do
    member do
      get :followings, :followers
    end
  end
  resources :user_follows, only: [:create, :destroy]
end
