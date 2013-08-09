class DilegnoImage < ActiveRecord::Base
  attr_accessible :image, :imageable_id, :imageable_type

  belongs_to :imageable, polymorphic: true

	has_attached_file :image, 
  :styles => { :medium => "600x600>", :thumb => "300x300>" }, 
  :default_url => "/images/:style/missing.png",
  :convert_options => { :all => "-quality 75 -strip"}
end
