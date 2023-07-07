Rails.application.routes.draw do
  resources :webhook_targets

  get '/hooks/:token', to: 'webhook_targets#hooks', as: 'hooks'

  # Defines the root path route ("/")
  root "webhook_targets#index"
end
