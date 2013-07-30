class Admin::FeaturedImageController < AdminController
	def index
		@featured = FeaturedImage.all
	end

	def new
		@featured = FeaturedImage.new
	end

	def create
		featured = FeaturedImage.new(params[:featured_image])
		featured.build_dilegno_image(params[:dilegno_image])
		featured.save
		redirect_to :action => "index"
	end

	def show
	end

	def edit
		@featured = FeaturedImage.find(params[:id])
		@featured_image = @featured.dilegno_image
	end

	def update
		featured = FeaturedImage.find(params[:id])
		featured.update_attributes(params[:featured_image])
		featured.dilegno_image.update_attributes(params[:dilegno_image])
		featured.save
		redirect_to :action => "index"
	end

	def destroy
		@featured = FeaturedImage.find(params[:id])
  	@featured.destroy
  	redirect_to :action => "index"
	end
end
