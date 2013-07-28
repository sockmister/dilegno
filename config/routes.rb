Dilegno::Application.routes.draw do
  get "sessions/new"

  get "admin_users/new"

	namespace :admin do

    get "login" => "sessions#new", :as => "log_in"
    get "logout" => "sessions#destroy", :as => "log_out"
    post "login" => "sessions#create", :as => "log_in"
    resources :session

  	resources :featured_image
  	resources :sub_category
  	resources :product
    resources :news

    resources :category do
      resources :sub_category
    end
    
    resources :product do
      resources :product_image
    end
	end

	resources :category
  resources :sub_category
  resources :product
  resources :news

  # get "products/categories"
  get "home/index"
  root :to => "home#index"
end
