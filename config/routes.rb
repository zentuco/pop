Rails.application.routes.draw do
  root to: 'pages#home'
  resources :orders, only: [:create] do
    resources :payments, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :designs do
    resources :requests, only: [:index, :create, :update, :edit, :destroy, :new]
    post 'upvote', to: 'designs#upvote'
  end
  resources :requests, only: [:index, :show]
  resources :contributions, only: [:update, :edit, :destroy, :create]
  resources :projects, only: [:create, :update, :destroy, :show, :index]
  get 'dashboard', to: 'users#dashboard'
  get 'topup', to: 'pages#deals'
  get 'become-designer', to: 'pages#designerlanding'
  get 'profile', to: 'users#profile'
  get 'modal_edit_profile', to: 'users#modal_edit_profile'
  patch 'update_user_profile', to: 'users#update_user_profile', as: 'update_user_profile'
  delete 'destroy_user_profile', to: 'users#destroy', as: 'destroy_user_profile'
  get 'thingiverse', to: 'thingiverse#search_thingiverse'
  get 'thingiverse/:id', to: 'thingiverse#show', as: 'thingiverse-design'
  post 'thingiverse/create-design', to: 'thingiverse#create_design', as: 'create_thingiverse_design'
  devise_for :users, controllers: { sessions: "paths" }
  get 'users/:id/profile', to: 'users#show', as: 'user_page'
  put 'users/designer', to: 'users#designer', as: 'designer'
  resources :designers, only: [:new, :create, :index]
  post 'designers/approve', to: 'designers#approve', as: 'approve'
end

