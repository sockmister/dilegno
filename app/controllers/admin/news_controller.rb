class Admin::NewsController < AdminController
	def index
		@news = News.all
	end

	def new
		@news = News.new
	end

	def create
		@news = News.new(params[:news])
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
		@news.save
		redirect_to :action => "index"
	end

	def destroy
		@news = News.find(params[:id])
  	@news.destroy
  	redirect_to :action => "index"
	end
end
 