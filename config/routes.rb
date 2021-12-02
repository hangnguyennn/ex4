Rails.application.routes.draw do
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

root 'products#index'



resources :products
# get  'users/new'
resources :users
end
