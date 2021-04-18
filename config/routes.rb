Rails.application.routes.draw do
  root to: 'categories#index'
  get 'categories/search'
  resources :categories, only: [:new, :create]
end
