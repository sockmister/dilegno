class AddColumnsToPressRelease < ActiveRecord::Migration
  def change
  	add_attachment :press_releases, :document
  end
end
