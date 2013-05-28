Dilegno::Application.routes.draw do
  get "products/categories"

  get "home/index"

  root :to => "home#index"

end
