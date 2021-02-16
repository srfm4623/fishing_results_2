Rails.application.routes.draw do
  devise_for :users

  root to: 'results#index'

  resources :results, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: :create
  end

  resources :users, only: :show

end
