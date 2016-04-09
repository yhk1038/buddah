class CreateViewCountSites < ActiveRecord::Migration
  def change
    create_table :view_count_sites do |t|
      t.string  :ip_address
      t.string  :view_date
      t.timestamps null: false
    end
  end
end
