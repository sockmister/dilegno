class AddContentToNews < ActiveRecord::Migration
  def change
  	add_column :news, :content, :text
  end
end
