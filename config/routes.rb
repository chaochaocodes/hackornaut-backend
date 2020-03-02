Rails.application.routes.draw do
  resources :emails_breaches
  resources :breaches
  post 'emails/search', to: 'emails#search'
  resources :emails
  post 'users/login', to: 'users#login'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
