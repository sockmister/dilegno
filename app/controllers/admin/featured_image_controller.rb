class Admin::FeaturedImageController < AdminController
	def index
		@featured = FeaturedImage.all
	end

	def new
		@featured = FeaturedImage.new
	end

	def create
		@featured = FeaturedImage.new(params[:featured_image])
		@featured.save
		redirect_to :action => "index"
	end

	def show
	end

	def edit
		@featured = FeaturedImage.find(params[:id])
	end

	def update
	end

	def destroy
		@featured = FeaturedImage.find(params[:id])
  	@featured.destroy
  	redirect_to :action => "index"
	end
end
