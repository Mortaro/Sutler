class CreateShips < ActiveRecord::Migration
  def change
    create_table :ships do |t|
      t.string :name
      t.text :history

      t.timestamps null: false
    end
  end
end
