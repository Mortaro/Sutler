# This migration comes from sutler (originally 20150219032040)
class CreateSutlerUploads < ActiveRecord::Migration
  def change
    create_table :sutler_uploads do |t|
      t.binary :data
      t.string :filename
      t.string :mime_type

      t.timestamps null: false
    end
  end
end
