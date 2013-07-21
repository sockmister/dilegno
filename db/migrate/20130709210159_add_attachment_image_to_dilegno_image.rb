class AddAttachmentImageToDilegnoImage < ActiveRecord::Migration
  def change
  	add_attachment :dilegno_images, :image
  end
end
