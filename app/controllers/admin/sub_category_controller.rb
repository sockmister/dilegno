class Admin::SubCategoryController < AdminController
	def index
		@category = Category.find(params[:category_id])
		@sub_categories = @category.sub_categories
	end

	def new
		@category = Category.find(params[:category_id])
		@sub_category = SubCategory.new
	end

	# check this
	def create
		sub_category = SubCategory.create(params[:sub_category])
		sub_category.category_id = params[:category_id]
		sub_category.build_dilegno_image(params[:dilegno_image])
		sub_category.save
		redirect_to admin_category_sub_category_index_path(params[:category_id])
	end

	def edit
		@sub_category = SubCategory.find(params[:id])
		@category = Category.find(@sub_category.category_id)
		@sub_category_image = @sub_category.dilegno_image
	end

	def update
		sub_category = SubCategory.find(params[:id])
		sub_category.update_attributes(params[:sub_category])
		sub_category.dilegno_image.update_attributes(params[:dilegno_image])
		sub_category.save
		redirect_to admin_category_sub_category_index_path(params[:category_id])
	end

	def destroy
		sub_category = SubCategory.find(params[:id])
		sub_category.destroy
		sub_category.save
		# redirect_to :action => "admin/category/index"
		# link_to 'Sub Categories', admin_category_sub_category_index_path(params[:category_id])
		redirect_to admin_category_sub_category_index_path(params[:category_id])
	end
end
