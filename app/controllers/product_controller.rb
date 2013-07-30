class ProductController < ApplicationController
	def show
		@product = Product.find(params[:id])
		@product_images = @product.dilegno_images

		@category = Category.where(:id => @product.category_id).first
		# @category = category.name
		@sub_category = SubCategory.where(:category_id => @category.id)

	end
end
