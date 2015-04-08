PostitTemplate::Application.routes.draw do
  root to: 'lists#index'

  resources :lists, except: [:destroy] do
    resources :items do
      member do
        post :complete
      end
    end
  end
  
  resources :users, except: [:index, :destroy]
end
