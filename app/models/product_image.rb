class ProductImage < ActiveRecord::Base
	attr_accessible :image
  belongs_to :product
end
