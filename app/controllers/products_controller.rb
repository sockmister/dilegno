class ProductsController < ApplicationController
	def index
	end

	def new
	end

	def create
	end

	def show
		@product = Product.find(params[:id])
	end

	def edit
	end

	def update
	end

	def destroy
	end

  def categories
  end
end
