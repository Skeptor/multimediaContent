Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :movies

      resources :seasons do
        resources :episodes
      end

      get '/contents', to: 'contents#index'
      post '/purchase', to: 'purchases#create'
    
      resources :users do
        get :library, on: :member
      end

    end
  end
end
