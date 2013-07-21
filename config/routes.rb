Dilegno::Application.routes.draw do
	namespace :admin do

  	resources :featured_image
  	resources :sub_category
  	resources :product

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

  # get "products/categories"
  get "home/index"
  root :to => "home#index"
end
