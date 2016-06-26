# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160602005219) do

  create_table "families", force: :cascade do |t|
    t.integer  "turn"
    t.string   "role"
    t.string   "name"
    t.string   "content"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "histories", force: :cascade do |t|
    t.integer  "year"
    t.integer  "month"
    t.integer  "date"
    t.string   "content1"
    t.string   "content2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "infors", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "numm"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "intabs", force: :cascade do |t|
    t.integer  "tab_id"
    t.string   "name"
    t.string   "templete"
    t.integer  "turn"
    t.string   "subscribe"
    t.string   "img"
    t.integer  "who_can_create"
    t.integer  "who_can_read"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "main_crcs", force: :cascade do |t|
    t.integer  "turn"
    t.string   "img"
    t.string   "title1"
    t.string   "title2"
    t.string   "subtitle1"
    t.string   "subtitle2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "intab_id"
    t.string   "author_name"
    t.integer  "author_id"
    t.string   "author_passwd"
    t.string   "title"
    t.text     "file1"
    t.text     "file2"
    t.text     "ir1"
    t.boolean  "visible"
    t.boolean  "anonymous"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "replies", force: :cascade do |t|
    t.integer  "post_id"
    t.string   "author_name"
    t.integer  "author_id"
    t.string   "author_passwd"
    t.text     "content"
    t.boolean  "visible"
    t.boolean  "anonymous"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "signatures", force: :cascade do |t|
    t.integer  "sg_signNm"
    t.string   "sg_signTitle"
    t.string   "sg_name"
    t.string   "sg_birth"
    t.integer  "sg_tel_1"
    t.integer  "sg_tel_2"
    t.integer  "sg_tel_3"
    t.string   "sg_mail_1"
    t.string   "sg_mail_2"
    t.text     "sg_opinion"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "tabs", force: :cascade do |t|
    t.string   "name"
    t.integer  "turn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "under_replies", force: :cascade do |t|
    t.integer  "reply_id"
    t.string   "author_name"
    t.integer  "author_id"
    t.string   "author_passwd"
    t.text     "content"
    t.boolean  "visible"
    t.boolean  "anonymous"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",               default: "", null: false
    t.string   "nickname",               default: "", null: false
    t.integer  "agree1"
    t.integer  "agree2"
    t.string   "mb_id",                  default: "", null: false
    t.string   "hint",                   default: "", null: false
    t.string   "ht_answer",              default: "", null: false
    t.string   "goraebang4d",            default: ""
    t.string   "phonenumber",            default: "", null: false
    t.string   "birthy",                 default: "", null: false
    t.string   "birthm",                 default: "", null: false
    t.string   "birthd",                 default: "", null: false
    t.integer  "issolar"
    t.integer  "islady",                 default: 0,  null: false
    t.string   "post",                   default: "", null: false
    t.string   "addr",                   default: "", null: false
    t.string   "addr2",                  default: "", null: false
    t.integer  "mb_mailling",            default: 0,  null: false
    t.integer  "mb_open",                default: 1,  null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "view_count_posts", force: :cascade do |t|
    t.integer  "post_id"
    t.string   "ip_adress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "view_count_sites", force: :cascade do |t|
    t.string   "ip_address"
    t.string   "view_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
