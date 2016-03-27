class CreateMainCrcs < ActiveRecord::Migration
  def change
    create_table :main_crcs do |t|
      
      t.integer :turn
      t.string :img
      t.string :title1      #8자 제한
      t.string :title2      #8자 제한
      t.string :subtitle1   #12자 제한
      t.string :subtitle2   #12자 제한

      t.timestamps null: false
    end
  end
end
