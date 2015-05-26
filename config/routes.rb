Rails.application.routes.draw do
  post 'create', to: 'shortens#create', as: 'shorten'
  get 'expand/:slug', to: 'shortens#expand', as: 'expand', defaults: {format: :json}
end
