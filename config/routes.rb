Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/me', to: 'users#me'
  resources :users, only: %i[show update]
  resources :events, only: %i[index show create new] do
    resources :messages, only: :create
    resources :registrations, only: :create
  end
  namespace :my do
    resources :events, only: %i[index]
  end
end
