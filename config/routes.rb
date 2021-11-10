Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/foods/search', to: 'food_search#index'
      get '/users', to: 'users#login'
      get '/users/:id/meals', to: 'meals#meals'
      post '/users/:id/meals', to: 'meals#create'
      patch '/users/:id/meals', to: 'meals#update'
      get '/users/:id/foods', to: 'food_entries#index'
      get '/users/:id/graphs', to: 'graphs#index'
    end
  end
end
