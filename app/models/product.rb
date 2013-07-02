class Product < ActiveRecord::Base
  attr_accessible :category, :color, :description, :name, :sub_category, :price, :category_id

  # TODO: 	validation for category and sub_category.
  # 				Each product must have a category.
  # 				A product may or may not have a sub_category
  # 				If a product has a sub_category, its corresponding sub_category model should
  # 				reference the category.

  has_many :product_images
  has_one :category
end
