class FeaturedImage < ActiveRecord::Base
  attr_accessible :description, :link, :image

  has_one :dilegno_image, as: :imageable
end
