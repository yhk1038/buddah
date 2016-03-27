class CreateTabs < ActiveRecord::Migration
  def change
    create_table :tabs do |t|
      
      t.string  :name
      t.integer :turn

      t.timestamps null: false
    end
  end
end
