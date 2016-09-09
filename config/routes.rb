Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'sports#index'
  get "/", to: 'sports#index'

  namespace :api do
    namespace :v1 do
      get '/sports', to:'sports#index'
      get '/sports/:id', to:'sports#show'

      post '/sports', to:'sports#create'
      patch '/sports/:id', to:'sports#update'
      delete '/sports/:id', to:'sports#destroy'
    end
  end
end
