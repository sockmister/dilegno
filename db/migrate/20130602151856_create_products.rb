class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :color
      t.references :category
      t.references :sub_category

      t.timestamps
    end
  end
end
