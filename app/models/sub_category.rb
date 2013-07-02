class SubCategory < ActiveRecord::Base
  attr_accessible :name, :category_id
  has_one :category
end
