Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/me', to: 'users#me'
  resources :users, only: %i[show]
  resources :events, only: %i[index]
end
