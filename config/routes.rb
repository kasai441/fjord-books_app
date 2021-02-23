Rails.application.routes.draw do
  root 'books#index'
  devise_for :users, controllers: {
    profiles: 'users/profiles'
  }

  devise_scope :user do
    get 'users', to: "users/profiles#index"
    get 'users/:id', to: "users/profiles#show", as: :user
  end

  resources :books
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
