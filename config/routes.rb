Dilegno::Application.routes.draw do
	namespace :admin do
  	resources :category
  	resources :featured_image
  	resources :sub_category
  	resources :product

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
