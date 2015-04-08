PostitTemplate::Application.routes.draw do
  root to: 'lists#index'

  resources :lists, except: [:destroy]
  resources :users, except: [:index, :destroy]
end
