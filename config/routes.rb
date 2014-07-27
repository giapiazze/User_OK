Rails.application.routes.draw do
  namespace :admin do
    resources :roles
  end

  namespace :admin do
  get 'administer/index'
  end

  root to: 'visitors#index'

  devise_for :users
  scope "/admin" do
    resources :users
  end

  resources :users do
    collection do
      get 'view_locked'
    end
  end
end