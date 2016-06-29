class CreateIntabs < ActiveRecord::Migration
  def change
    create_table :intabs do |t|
      
      t.integer :tab_id
      t.string  :name
      t.string  :templete
      t.integer :turn
      
      # 겔러리 용
      t.string  :subscribe      #겔러리 한 줄 소개
      t.string  :img            
      
      # 권한 설정
      t.integer :who_can_create #글쓰기 권한
      t.integer :who_can_read   #읽기 권한

      t.timestamps null: false
    end
  end
end
