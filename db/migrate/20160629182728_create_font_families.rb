class CreateFontFamilies < ActiveRecord::Migration
  def change
    create_table :font_families do |t|
      t.integer :intab_id
      t.string :ftype

      t.timestamps null: false
    end
  end
end
