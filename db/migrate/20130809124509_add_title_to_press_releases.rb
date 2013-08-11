class AddTitleToPressReleases < ActiveRecord::Migration
  def change
  	add_column :press_releases, :title, :string
  end
end
