Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  put 'tisks/:id/edit', to: 'tisks#update'

  get 'signup', to: 'users#new'
  get 'tisks/:id/edit', to: 'tisks#edit'

 resources :users, only: [:index, :show, :new, :create]

 resources :tisks, only: [:create, :destroy, :edit, :update]
end
