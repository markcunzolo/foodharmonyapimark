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

ActiveRecord::Schema.define(version: 20160822145553) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "restaurant_genres", id: false, force: :cascade do |t|
    t.integer "restaurant_id"
    t.integer "genre_id"
  end

  add_index "restaurant_genres", ["genre_id"], name: "index_restaurant_genres_on_genre_id", using: :btree
  add_index "restaurant_genres", ["restaurant_id", "genre_id"], name: "index_restaurant_genres_on_restaurant_id_and_genre_id", using: :btree

  create_table "restaurant_likes", id: false, force: :cascade do |t|
    t.integer "restaurant_id"
    t.integer "user_id"
    t.boolean "liked",         default: false
    t.boolean "disliked",      default: false
  end

  add_index "restaurant_likes", ["restaurant_id", "user_id"], name: "index_restaurant_likes_on_restaurant_id_and_user_id", using: :btree
  add_index "restaurant_likes", ["user_id"], name: "index_restaurant_likes_on_user_id", using: :btree

  create_table "restaurant_types", id: false, force: :cascade do |t|
    t.integer "restaurant_id"
    t.integer "type_id"
  end

  add_index "restaurant_types", ["restaurant_id", "type_id"], name: "index_restaurant_types_on_restaurant_id_and_type_id", using: :btree
  add_index "restaurant_types", ["type_id"], name: "index_restaurant_types_on_type_id", using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "street_address"
    t.string   "zip_code"
    t.string   "web_site"
    t.string   "phone_number"
    t.string   "cost"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

end
