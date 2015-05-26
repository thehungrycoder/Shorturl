Rails.application.routes.draw do
  post '/', to: 'shortens#create', as: 'shorten'
  get '/:slug', to: 'shortens#expand', as: 'expand', defaults: {format: :json}
end
