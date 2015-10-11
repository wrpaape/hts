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

ActiveRecord::Schema.define(version: 20151007230811) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assets", force: :cascade do |t|
    t.string   "key"
    t.string   "type"
    t.string   "filename"
    t.string   "path"
    t.string   "default"
    t.string   "parent_type"
    t.integer  "parent_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "assets", ["parent_id"], name: "index_assets_on_parent_id", using: :btree

  create_table "brands", force: :cascade do |t|
    t.string   "key"
    t.string   "name"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "type"
    t.string   "info"
    t.integer  "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "contacts", ["member_id"], name: "index_contacts_on_member_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.string   "key"
    t.string   "name"
    t.string   "path"
    t.string   "title"
    t.text     "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "perks", force: :cascade do |t|
    t.string   "key"
    t.string   "name"
    t.text     "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "key"
    t.string   "type"
    t.string   "category"
    t.string   "name"
    t.string   "path"
    t.text     "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specs", force: :cascade do |t|
    t.string   "key"
    t.string   "title"
    t.text     "body"
    t.string   "parent_type"
    t.integer  "parent_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "specs", ["parent_id"], name: "index_specs_on_parent_id", using: :btree

  add_foreign_key "contacts", "members"
end
