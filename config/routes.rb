Rails.application.routes.draw do
  root 'groups#index'
  resources :members
  resources :groups
  namespace :operation_members do
    resources :participates, only: [:create, :destroy]
    resources :roles, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
