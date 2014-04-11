StopAndShop::Application.routes.draw do
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"

  root :to => "products#index"
  resources :products
  resources :users, :only => [:new, :create]
  resources :sessions, :except => [:show, :edit, :update]
  resources :product_uploads
end
