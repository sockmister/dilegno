class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :sub_categories

  # cache
  def Category.all_category
  	@@categories ||= Category.all
  end

  def sub_categories_with_default
  	if sub_categories.empty?
  		to_return = self
  		to_return.id = self.name
  		[to_return]
  	else
  		sub_categories
  	end
  end
end
