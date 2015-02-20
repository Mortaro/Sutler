class CreateSutlerUsers < ActiveRecord::Migration
  def change
    create_table :sutler_users do |t|

      t.timestamps null: false
    end
  end
end
