class Admin::NewsController < AdminController
	def index
		@news = News.all
	end

	def new
		@news = News.new
	end

	def create
		@news = News.create(params[:news])

		if params[:dilegno_image]
			params[:dilegno_image].each_value { |img| 
				@news.dilegno_images.create(img)
			}
		end
		@news.save
		redirect_to :action => "index"
	end

	def edit
		@news = News.find(params[:id])
	end

	def update
		@news = News.find(params[:id])
		@news.title = params[:news][:title]
		@news.content = params[:news][:content]

		# for each existing dilegno_image, we check if there is corresponding hidden value
		# if yes, we skip
		# else we delete
		if @news.dilegno_images
			@news.dilegno_images.each do |img|
				unless params["dilegno#{img.id}"]
					img.delete
				end
			end
		end

		# we build for new images
		if params[:dilegno_image]
			params[:dilegno_image].each_value { |img| 
				@news.dilegno_images.create(img)
			}
		end

		@news.save
		redirect_to :action => "index"
	end

	def destroy
		@news = News.find(params[:id])
  	@news.destroy
  	redirect_to :action => "index"
	end
end
 