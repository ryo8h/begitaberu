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

ActiveRecord::Schema.define(version: 20170103075159) do

  create_table "cart_details", force: :cascade do |t|
    t.integer  "cart_id",                null: false
    t.integer  "food_id",                null: false
    t.integer  "quantity",   default: 1
    t.integer  "subtotal"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "cart_details", ["cart_id"], name: "index_cart_details_on_cart_id"
  add_index "cart_details", ["food_id"], name: "index_cart_details_on_food_id"

  create_table "carts", force: :cascade do |t|
    t.integer  "member_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "carts", ["member_id"], name: "index_carts_on_member_id"

  create_table "food_images", force: :cascade do |t|
    t.integer  "food_id",      null: false
    t.binary   "data"
    t.string   "content_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "food_images", ["food_id"], name: "index_food_images_on_food_id"

  create_table "foods", force: :cascade do |t|
    t.string   "name",        null: false
    t.integer  "price",       null: false
    t.date     "sale_start",  null: false
    t.date     "sale_end",    null: false
    t.integer  "stock",       null: false
    t.string   "locality",    null: false
    t.string   "detail",      null: false
    t.string   "producer",    null: false
    t.date     "havest_date", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "user_name",                       null: false
    t.string   "name",                            null: false
    t.string   "password_digest",                 null: false
    t.string   "email",                           null: false
    t.integer  "gender",          default: 0,     null: false
    t.integer  "age",                             null: false
    t.string   "address",                         null: false
    t.boolean  "user_type",       default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "order_details", force: :cascade do |t|
    t.integer  "order_id",                   null: false
    t.integer  "food_id",                    null: false
    t.integer  "quantity"
    t.integer  "subtotal"
    t.boolean  "reserve",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "order_details", ["food_id"], name: "index_order_details_on_food_id"
  add_index "order_details", ["order_id"], name: "index_order_details_on_order_id"

  create_table "orders", force: :cascade do |t|
    t.date     "order_date"
    t.integer  "member_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orders", ["member_id"], name: "index_orders_on_member_id"

  create_table "past_orders", force: :cascade do |t|
    t.integer  "member_id",     null: false
    t.integer  "order_id",      null: false
    t.date     "delivery_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "past_orders", ["member_id"], name: "index_past_orders_on_member_id"
  add_index "past_orders", ["order_id"], name: "index_past_orders_on_order_id"

end
