class News < ActiveRecord::Base
  attr_accessible :title, :content

  has_many :dilegno_images, as: :imageable
end
