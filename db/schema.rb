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

ActiveRecord::Schema.define(version: 20150910100355) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flocks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "flocks", ["created_at"], name: "index_flocks_on_created_at", using: :btree

  create_table "tray_types", force: :cascade do |t|
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trays", force: :cascade do |t|
    t.integer  "washed",       default: 0
    t.integer  "waste",        default: 0
    t.integer  "flock_id"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "tray_type_id"
  end

  add_index "trays", ["created_at"], name: "index_trays_on_created_at", using: :btree
  add_index "trays", ["flock_id"], name: "index_trays_on_flock_id", using: :btree
  add_index "trays", ["tray_type_id"], name: "index_trays_on_tray_type_id", using: :btree
  add_index "trays", ["user_id"], name: "index_trays_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "trays", "flocks"
  add_foreign_key "trays", "tray_types"
  add_foreign_key "trays", "users"
end
