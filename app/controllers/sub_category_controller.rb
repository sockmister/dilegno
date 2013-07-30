class SubCategoryController < ApplicationController
	def show
		@sub_category = SubCategory.find(params[:id])
		@category = Category.find(@sub_category.category_id)
		@products = Product.where(:sub_category_id => params[:id])
	end
end
