Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  get 'items', to: 'items#index'
end
