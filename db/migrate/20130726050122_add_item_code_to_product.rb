class AddItemCodeToProduct < ActiveRecord::Migration
  def change
  	add_column :products, :item_code, :string
  end
end
