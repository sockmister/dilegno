class Product < ActiveRecord::Base
  attr_accessible :category, :color, :description, :name, :sub_category, :price, :category_id, :sub_category_id, :item_code, :length, :width, :height, :made_of

  # TODO: 	validation for category and sub_category.
  # 				Each product must have a category.
  # 				A product may or may not have a sub_category
  # 				If a product has a sub_category, its corresponding sub_category model should
  # 				reference the category.

  has_many :dilegno_images, as: :imageable
  has_one :category

  def sub_category_value
  	if sub_category_id == nil
  		if category_id != nil
  			Category.find(category_id).name
  		else
  			""
  		end
  	else
  		SubCategory.find(sub_category_id).name
  	end
  end
end
