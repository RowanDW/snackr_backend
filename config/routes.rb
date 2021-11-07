Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/foods/search', to: 'food_search#index'
      get '/users', to: 'users#login'
      get '/users/:id/foods', to: 'food_entries#index'
    end
  end
end
