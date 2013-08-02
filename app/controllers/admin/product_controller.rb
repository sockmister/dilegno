class Admin::ProductController < AdminController
	def index
		@products = Product.order('name')
	end

	def new
		@product = Product.new
		@category = Category.all
	end

	def create
		@product = Product.create(params[:product])
		# cat = Category.where(:name => params[:product][:category_id]).first
		# if cat
		# 	@product.category_id = cat.id
		# end
		# # sub_cat = SubCategory.where(:name => params[:product][:sub_categroy_id])
		# if params[:product][:category_id] != 0
		# 	@product.sub_category_id = params[:product][:category_id]
		# end

		cat = SubCategory.where(:name => params[:product][:sub_category_id]).first
		if cat == nil
			logger.info 'cat is nil'
			cat = Category.where(:name => params[:product][:sub_category_id]).first
			@product.sub_category_id = nil
			@product.category_id = cat.id
		else
			logger.info 'cat is not nil'
			@product.sub_category_id = cat.id
			if cat.category == nil
				logger.info 'cat.category is nil'
				@product.category_id = nil
				@product.sub_category_id = nil
			else
				logger.info 'cat.category is not nil'
				@product.category_id = cat.category.id
			end
		end

		if params[:dilegno_image]
			params[:dilegno_image].each_value { |img| 
				@product.dilegno_images.create(img)
			}
		end
		@product.save
		redirect_to :action => "index"
	end

	# def show
	# end

	def edit
		@product = Product.find(params[:id])
		if @product.category_id
			@curr_category = Category.find(@product.category_id).name
		else
			@curr_category = ""
		end
		if @product.sub_category_id && @product.sub_category_id != 0
			@curr_sub_cat = SubCategory.find(@product.sub_category_id).name
		else
			@curr_sub_cat = ""
		end
		@category = Category.all
	end

	def update
		@product = Product.find(params[:id])
		# cat = Category.where(:name => params[:product][:category_id]).first
		# if params[:product][:category_id] && cat != nil
		# 	params[:product][:category_id] = cat.id
		# end

		@product.update_attributes(params[:product].except(:sub_category_value))
		cat = SubCategory.where(:name => params[:product][:sub_category_value]).first
		if cat == nil
			logger.info 'cat is nil'
			cat = Category.where(:name => params[:product][:sub_category_value]).first
			@product.sub_category_id = nil
			@product.category_id = cat.id
		else
			logger.info 'cat is not nil'
			@product.sub_category_id = cat.id
			if cat.category == nil
				logger.info 'cat.category is nil'
				@product.category_id = nil
				@product.sub_category_id = nil
			else
				logger.info 'cat.category is not nil'
				@product.category_id = cat.category.id
			end
		end

		# for each existing dilegno_image, we check if there is corresponding hidden value
		# if yes, we skip
		# else we delete
		if @product.dilegno_images
			@product.dilegno_images.each do |img|
				unless params["dilegno#{img.id}"]
					img.delete
				end
			end
		end

		# we build for new images
		if params[:dilegno_image]
			params[:dilegno_image].each_value { |img| 
				@product.dilegno_images.create(img)
			}
		end

		@product.save
		redirect_to :action => "index"
	end

	def destroy
		@product = Product.find(params[:id])
  	@product.destroy
  	redirect_to :action => "index"
	end
end
