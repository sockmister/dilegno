class AddImageableToDilegnoImage < ActiveRecord::Migration
  def change
  	add_column :dilegno_images, :imageable_id, :integer
  	add_column :dilegno_images, :imageable_type, :string
  end
end
