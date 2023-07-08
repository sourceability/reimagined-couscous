Rails.application.routes.draw do
  require 'resque/server'
  mount Resque::Server, at: '/jobs'

  resources :webhook_targets

  post '/hooks/:token', to: 'webhook_targets#hooks', as: 'hooks'

  # Defines the root path route ("/")
  root "webhook_targets#index"
end
