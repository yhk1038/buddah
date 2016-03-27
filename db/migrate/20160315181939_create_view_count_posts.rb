class CreateViewCountPosts < ActiveRecord::Migration
  def change
    create_table :view_count_posts do |t|
      
      t.integer :post_id
      t.string  :ip_adress

      t.timestamps null: false
    end
  end
end
