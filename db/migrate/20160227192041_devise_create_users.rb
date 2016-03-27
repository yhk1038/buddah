class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      
      ## 추가(이름, 닉네임, *이메일, 아이디, *비밀번호, 확인질문, 확인답변, 
      ##       전화번호, 생년월일, 음양력, 성별, 주소, 기타설정-메일링, 정보공개)
      t.string :username,           null: false, default: ""
      t.string :nickname,           null: false, default: ""
      t.integer :agree1,            null: true
      t.integer :agree2,            null: true
      t.string :mb_id,              null: false, default: ""
      t.string :hint,               null: false, default: ""
      t.string :ht_answer,          null: false, default: ""
      
      # 선택사항(){
      t.string :phonenumber,        null: false, default: ""
        t.string :birthy,           null: false, default: ""
        t.string :birthm,           null: false, default: ""
        t.string :birthd,           null: false, default: ""
        t.integer :issolar
      t.integer :islady,           null: false, default: 0
        # 우편번호(){
          t.string :post,           null: false, default: ""
          t.string :addr,           null: false, default: ""
          t.string :addr2,           null: false, default: ""
        # }
        # 개인설정(){
        t.integer :mb_mailling,     null: false, default: 0
        t.integer :mb_open,         null: false, default: 0
        # }
      # }
      
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
