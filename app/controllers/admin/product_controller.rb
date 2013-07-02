class Admin::ProductController < AdminController
	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(params[:product])
		@product.save
		redirect_to :action => "index"
	end

	# def show
	# end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		@product.name = params[:product][:name]
		@product.save
		redirect_to :action => "index"
	end

	def destroy
		@product = Product.find(params[:id])
  	@product.destroy
  	redirect_to :action => "index"
	end

  def categories
  end
end
