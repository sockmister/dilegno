class CreateDilegnoImages < ActiveRecord::Migration
  def change
    create_table :dilegno_images do |t|

      t.timestamps
    end
  end
end
