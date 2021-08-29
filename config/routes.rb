Rails.application.routes.draw do
  root 'groups#index'
  resources :members
  resources :groups
  namespace :operation_members do
    resources :participates, only: [:update, :destroy]
    resources :roles, only: [:update]
  end
  resources :group_members, only: [:update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
