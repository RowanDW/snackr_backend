Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # resources :food_entries
      # resources :meals

      get '/foods/search', to: 'food_search#index'
      get '/users', to: 'users#login'
    end
  end
end
