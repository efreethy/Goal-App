Rails.application.routes.draw do
  resources :users do
    resources :goals, only: [:show]
  end
  resource :session
  resources :goals, except: [:show]
end
