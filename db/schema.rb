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

ActiveRecord::Schema.define(version: 20160503205841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "libraries", force: :cascade do |t|
    t.string   "name"
    t.integer  "floor_count"
    t.integer  "floor_area"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "library_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "library_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "library_users", ["library_id"], name: "index_library_users_on_library_id", using: :btree
  add_index "library_users", ["user_id"], name: "index_library_users_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "library_users", "libraries"
  add_foreign_key "library_users", "users"
end
