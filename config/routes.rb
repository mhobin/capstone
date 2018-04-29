Rails.application.routes.draw do
  namespace :v1 do
    get '/products' => 'products#index'
  end
end
