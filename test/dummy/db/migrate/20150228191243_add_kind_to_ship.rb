class AddKindToShip < ActiveRecord::Migration
  def change
    add_column :ships, :kind, :string
  end
end
