Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :movies do
        post '/purchase', to: 'movies#purchase'
      end

      resources :seasons do
        resources :episodes
        post '/purchase', to: 'seasons#purchase'
      end

      get '/contents', to: 'contents#index'

    end
  end
end
