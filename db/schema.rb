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
    t.string   "path_file"
    t.string   "path_alt"
    t.string   "parent_type"
    t.integer  "parent_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "assets", ["filename"], name: "index_assets_on_filename", using: :btree
  add_index "assets", ["key"], name: "index_assets_on_key", using: :btree
  add_index "assets", ["parent_id", "parent_type"], name: "index_assets_on_parent_id_and_parent_type", using: :btree
  add_index "assets", ["parent_id"], name: "index_assets_on_parent_id", using: :btree
  add_index "assets", ["parent_type"], name: "index_assets_on_parent_type", using: :btree
  add_index "assets", ["path_alt"], name: "index_assets_on_path_alt", using: :btree
  add_index "assets", ["path_file"], name: "index_assets_on_path_file", using: :btree

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
    t.string   "path_show"
    t.string   "title"
    t.text     "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "members", ["bio"], name: "index_members_on_bio", using: :btree
  add_index "members", ["key"], name: "index_members_on_key", using: :btree
  add_index "members", ["name"], name: "index_members_on_name", using: :btree
  add_index "members", ["path_show"], name: "index_members_on_path_show", using: :btree
  add_index "members", ["title"], name: "index_members_on_title", using: :btree

  create_table "perks", force: :cascade do |t|
    t.string   "key"
    t.string   "name"
    t.text     "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "perks", ["details"], name: "index_perks_on_details", using: :btree
  add_index "perks", ["key"], name: "index_perks_on_key", using: :btree
  add_index "perks", ["name"], name: "index_perks_on_name", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "key"
    t.string   "type"
    t.string   "type_display"
    t.string   "name"
    t.string   "path_show"
    t.text     "info"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "products", ["info"], name: "index_products_on_info", using: :btree
  add_index "products", ["key"], name: "index_products_on_key", using: :btree
  add_index "products", ["name"], name: "index_products_on_name", using: :btree
  add_index "products", ["path_show"], name: "index_products_on_path_show", using: :btree

  create_table "specs", force: :cascade do |t|
    t.string   "key"
    t.string   "title"
    t.text     "body"
    t.string   "parent_type"
    t.integer  "parent_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "specs", ["body"], name: "index_specs_on_body", using: :btree
  add_index "specs", ["key"], name: "index_specs_on_key", using: :btree
  add_index "specs", ["parent_id", "parent_type"], name: "index_specs_on_parent_id_and_parent_type", using: :btree
  add_index "specs", ["parent_id"], name: "index_specs_on_parent_id", using: :btree
  add_index "specs", ["parent_type"], name: "index_specs_on_parent_type", using: :btree
  add_index "specs", ["title"], name: "index_specs_on_title", using: :btree

  add_foreign_key "contacts", "members"
end
