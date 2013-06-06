Dilegno::Application.routes.draw do
	namespace :admin do
  	resources :category
  	resources :featured_image
  	resources :sub_category
  	resources :product
	end

  get "products/categories"
  get "home/index"
  root :to => "home#index"

end
