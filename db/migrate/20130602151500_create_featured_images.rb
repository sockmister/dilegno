class CreateFeaturedImages < ActiveRecord::Migration
  def change
    create_table :featured_images do |t|
      t.string :description
      t.string :link

      t.timestamps
    end
  end
end
