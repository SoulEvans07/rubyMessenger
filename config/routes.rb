Rails.application.routes.draw do
  get 'welcome', to: 'login#show', as: 'welcome'

  match 'sessions/create', to: 'sessions#create', via: :post, as: 'login'
  match 'sessions/destroy', to: 'sessions#destroy', via: [:delete, :get], as: 'logout'

  # users shouldn't be accessible
  # get 'users', to: 'users#index', as: 'users'

  get 'users/new', to: 'users#new', as: 'register'
  post 'users', to: 'users#create', as: 'user'

  get 'users/:id/edit', to: 'users#edit' , as: 'edit_profile'
  put 'users/:id', to: 'users#update', as: 'update_profile'

  get 'users/forgotten'
  post 'users/send_forgotten'

  get 'users/:id', to: 'users#show', as: 'profile'

  delete 'users/:id/destroy', to: 'users#destroy', as: 'delete_profile'

  resources :channels

  root :to => redirect('/welcome')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
