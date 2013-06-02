class AddAttachmentImageToFeaturedImages < ActiveRecord::Migration
  def self.up
    change_table :featured_images do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :featured_images, :image
  end
end
