Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :tables
  resources :charges

  get "/cuvee" => 'visitors#cuvee'
  get "/shay" => 'visitors#shay'
end
