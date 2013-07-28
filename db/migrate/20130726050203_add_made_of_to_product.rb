class AddMadeOfToProduct < ActiveRecord::Migration
  def change
  	add_column :products, :made_of, :string
  end
end
