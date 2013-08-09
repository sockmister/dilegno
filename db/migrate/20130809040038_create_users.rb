class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.boolean :is_subscribed

      t.timestamps
    end
  end
end
