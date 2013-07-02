class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :all_category

  def all_category
  	@categories  = Category.all
  end

end
