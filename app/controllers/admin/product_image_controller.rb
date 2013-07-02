class Admin::ProductImageController < AdminController
	def new
		@product_image = ProductImage.new
	end

	def create
		@product_image = ProductImage.new(params[:product_image])
		@product_image.save
	end
end
