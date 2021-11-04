Rails.application.routes.draw do
  resources :food_entries
  resources :meals
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
