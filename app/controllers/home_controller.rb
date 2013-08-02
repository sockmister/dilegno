class HomeController < ApplicationController
  def index
  	@featured_images = FeaturedImage.all
  end

  def about
  end
end
