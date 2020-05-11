Rails.application.routes.draw do
  root 'repositories#index'

  resources :repositories

  get 'landing/index'
end
