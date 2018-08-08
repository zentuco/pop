Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :designs do
    resources :requests, only: [:index, :create, :update, :edit, :destroy, :new]
  end
  resources :contributions, only: [:update, :edit, :destroy, :create]
  resources :projects, only: [:create, :update, :destroy, :show]
  get 'dashboard', to: 'users#dashboard'
  get 'topup', to: 'pages#deals'
  get 'becomeadesigner', to: 'pages#designerlanding'
end

