Blocitoff::Application.routes.draw do
  devise_for :users

  namespace :api do
    resources :users

    resources :lists do
      resources :items
      match '/items', to: 'items#options', via: [:options] 
    end
  end
end
