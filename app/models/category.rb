class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :sub_categories

  # cache
  def Category.all_category
  	@@categories ||= Category.all
  end
end
