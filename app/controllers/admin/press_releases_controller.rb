class Admin::PressReleasesController < AdminController
	def index
		@press = PressRelease.order('created_at')
	end

	def new
		@press = PressRelease.new
	end

	def create
		press = PressRelease.new(params[:press_release])
		press.build_dilegno_image(params[:dilegno_image])
		press.save
		redirect_to :action => "index"
	end

	def edit
		@press = PressRelease.find(params[:id])
	end

	def update
		press = PressRelease.find(params[:id])
		press.update_attributes(params[:press_release])
		press.dilegno_image.update_attributes(params[:dilegno_image])
		press.save
		redirect_to :action => "index"
	end

	def destroy
		press = PressRelease.find(params[:id])
		press.dilegno_image.destory if press.dilegno_image
  	press.destroy
  	redirect_to :action => "index"	
	end
end
