class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :year
      t.integer :month
      t.integer :date
      t.string :content1
      t.string :content2

      t.timestamps null: false
    end
  end
end
