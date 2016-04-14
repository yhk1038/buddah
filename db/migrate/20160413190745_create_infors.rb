class CreateInfors < ActiveRecord::Migration
  def change
    create_table :infors do |t|
      t.string :title
      t.string :content
      t.integer :numm

      t.timestamps null: false
    end
  end
end
