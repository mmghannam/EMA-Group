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

ActiveRecord::Schema.define(version: 20160917192945) do

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
    t.boolean  "placed",                                              default: false
    t.decimal  "price_pharmacy",             precision: 10, scale: 6, default: 0.0
    t.decimal  "price_population",           precision: 10, scale: 6, default: 0.0
  end

  create_table "categories", force: :cascade do |t|
    t.integer  "parent_id",          limit: 4
    t.string   "name",               limit: 255
    t.text     "comments",           limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
  end

  create_table "offers", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.text     "description",        limit: 65535
    t.date     "start"
    t.date     "end"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "product_id",       limit: 4
    t.integer  "quantity",         limit: 4
    t.integer  "cart_id",          limit: 4
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at",                                                        null: false
    t.decimal  "price_population",           precision: 10, scale: 6, default: 0.0
    t.decimal  "price_pharmacy",             precision: 10, scale: 6, default: 0.0
  end

  create_table "products", force: :cascade do |t|
    t.integer  "category_id",        limit: 4
    t.string   "name",               limit: 255
    t.decimal  "price_pharmacy",                   precision: 10, scale: 6
    t.decimal  "price_population",                 precision: 10, scale: 6
    t.text     "comments",           limit: 65535
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.integer  "position",               limit: 4,   default: 1
    t.string   "name",                   limit: 255
    t.string   "address",                limit: 255
    t.string   "landline_number",        limit: 255
    t.string   "mobile_number",          limit: 255
    t.string   "workplace",              limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
