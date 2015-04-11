PostitTemplate::Application.routes.draw do
  root to: 'lists#index'

  get '/register',  to: 'users#new'
  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  get '/logout',    to: 'sessions#destroy'

  resources :lists, except: [:destroy] do
    resources :items, except [:index, :destroy] do
      member do
        post :complete
      end
    end
  end

  resources :users, except: [:index, :destroy]
end
