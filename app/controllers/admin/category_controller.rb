class Admin::CategoryController < AdminController
	# display a list of all categories
	def index
		@categories = Category.all
		
	end

	# return a form for creating a new category
	# def new
	# end

	# create a new category
	def create
		@category = Category.new(params[:category])
		@category.save
		redirect_to :action => "index"
	end

	# show a specific category
	# def show
	# end

	# return a form for updating a category
	# def edit
	# end

	# update a category
	def update
	end

	# destroy a category
	def destroy
	end

end
