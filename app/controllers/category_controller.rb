class CategoryController < ApplicationController
	def index
		@category = Category.all
	end

	def new
	end

	def create
	end

	def show
		@category = Category.find(params[:id]).name
		@sub_category = SubCategory.where(:category_id => params[:id])
		@products = Product.where(:category_id => params[:id])
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
