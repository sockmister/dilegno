class FeaturedImage < ActiveRecord::Base
  attr_accessible :description, :link, :image

  has_attached_file :image, 
  :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
  :default_url => "/images/:style/missing.png"
end
