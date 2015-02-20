class AddColumnPhotosToShip < ActiveRecord::Migration
  def change
    add_column :ships, :photos, :text
  end
end
