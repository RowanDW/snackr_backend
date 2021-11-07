Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # resources :food_entries
      # resources :meals

      get '/foods/search', to: 'food_search#index'
      get '/users', to: 'users#login'
      get '/users/:id/meals', to: 'users#meals'
    end
  end
end
