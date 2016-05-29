class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.integer :turn     #순서
      t.string :role      #직급
      t.string :name      #이름
      t.string :content   #내용
      t.string :image     #이미지
      t.timestamps null: false
    end
  end
end
