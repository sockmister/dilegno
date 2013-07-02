class Admin::CategoryController < AdminController
	# display a list of all categories
	def index
		@categories = Category.all
	end

	# return a form for creating a new category
	def new
		@category = Category.new
	end

	# create a new category
	def create
		@category = Category.new(params[:category])
		@category.save
		redirect_to :action => "index"
	end

	# show a specific category
	def show
		@sub_category = Category.find(params[:id])
	end

	# return a form for updating a category
	def edit
		@category = Category.find(params[:id])
	end

	# update a category
	def update
		@category = Category.find(params[:id])
		@category.name = params[:category][:name]
		@category.save
		redirect_to :action => "index"
	end

	# destroy a category
	# cascade delete to sub_categories and products.
	# sub_categories should be destroyed
	# products with this category should be reassigned a new category
	def destroy
		@category = Category.find(params[:id])
  	@category.destroy
  	redirect_to :action => "index"
  end
end
