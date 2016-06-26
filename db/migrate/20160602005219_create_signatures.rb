class CreateSignatures < ActiveRecord::Migration
  def change
    create_table :signatures do |t|
      t.integer :sg_signNm
      t.string :sg_signTitle
      t.string :sg_name
      t.string :sg_birth
      t.integer :sg_tel_1
      t.integer :sg_tel_2
      t.integer :sg_tel_3
      t.string :sg_mail_1
      t.string :sg_mail_2
      t.text :sg_opinion

      t.timestamps null: false
    end
  end
end
