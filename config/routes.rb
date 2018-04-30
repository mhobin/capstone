Rails.application.routes.draw do
  post 'parent_user_token' => 'parent_user_token#create'
  post 'child_user_token' => 'child_user_token#create'
  namespace :v1 do
    get '/products' => 'products#index'
    post '/parent_users' => 'parent_users#create'
    post '/child_users' => 'child_users#create'
    post '/carted_products' => 'carted_products#create'

  end
end
