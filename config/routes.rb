Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :guests, only: [:index, :show] do
    resources :appearances, only: [:new]
  end
  resources :episodes, only: [:index, :show] do
    resources :appearances, only: [:new]
  end
  resources :appearances, only: [:new, :create, :edit, :update]

  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  get '/logout', to: 'sessions#destroy', as: 'logout'

end
