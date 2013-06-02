Dilegno::Application.routes.draw do
	namespace :admin do
  	resources :category
	end

  get "products/categories"
  get "home/index"
  root :to => "home#index"

end
