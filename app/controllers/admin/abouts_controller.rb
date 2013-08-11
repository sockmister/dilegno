class Admin::AboutsController < AdminController
	def index
		@about = About.order('created_at')
	end

	def new
		@about = About.new
	end

	def create
		about = About.new(params[:about])
		about.save
		redirect_to :action => "index"
	end

	def edit
		@about = About.find(params[:id])
	end

	def update
		about = About.find(params[:id])
		about.update_attributes(params[:about])
		about.save
		redirect_to :action => "index"
	end

	def destroy
		about = About.find(params[:id])
  	about.destroy
  	redirect_to :action => "index"	
	end
end
