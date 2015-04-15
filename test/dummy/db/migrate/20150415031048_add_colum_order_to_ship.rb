class AddColumOrderToShip < ActiveRecord::Migration
  def change
    add_column :ships, :order, :integer
  end
end
