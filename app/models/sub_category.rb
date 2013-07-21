class SubCategory < ActiveRecord::Base
  attr_accessible :name, :category_id

  belongs_to :category

  has_one :dilegno_image, as: :imageable
end
