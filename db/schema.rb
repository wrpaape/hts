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

ActiveRecord::Schema.define(version: 20151017230118) do

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
  add_index "assets", ["type"], name: "index_assets_on_type", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "key"
    t.string   "name"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "companies", ["key"], name: "index_companies_on_key", using: :btree
  add_index "companies", ["link"], name: "index_companies_on_link", using: :btree
  add_index "companies", ["name"], name: "index_companies_on_name", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "key"
    t.string   "type"
    t.boolean  "primary"
    t.string   "info1"
    t.string   "info2"
    t.string   "info3"
    t.string   "info4"
    t.string   "parent_type"
    t.integer  "parent_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "contacts", ["info1"], name: "index_contacts_on_info1", using: :btree
  add_index "contacts", ["info2"], name: "index_contacts_on_info2", using: :btree
  add_index "contacts", ["info3"], name: "index_contacts_on_info3", using: :btree
  add_index "contacts", ["info4"], name: "index_contacts_on_info4", using: :btree
  add_index "contacts", ["key"], name: "index_contacts_on_key", using: :btree
  add_index "contacts", ["parent_id", "parent_type"], name: "index_contacts_on_parent_id_and_parent_type", using: :btree
  add_index "contacts", ["parent_id"], name: "index_contacts_on_parent_id", using: :btree
  add_index "contacts", ["parent_type"], name: "index_contacts_on_parent_type", using: :btree
  add_index "contacts", ["primary"], name: "index_contacts_on_primary", using: :btree
  add_index "contacts", ["type"], name: "index_contacts_on_type", using: :btree

  create_table "employees", force: :cascade do |t|
    t.string   "key"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "full_name"
    t.string   "path_show"
    t.string   "title"
    t.text     "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "employees", ["bio"], name: "index_employees_on_bio", using: :btree
  add_index "employees", ["first_name"], name: "index_employees_on_first_name", using: :btree
  add_index "employees", ["full_name"], name: "index_employees_on_full_name", using: :btree
  add_index "employees", ["key"], name: "index_employees_on_key", using: :btree
  add_index "employees", ["last_name"], name: "index_employees_on_last_name", using: :btree
  add_index "employees", ["path_show"], name: "index_employees_on_path_show", using: :btree
  add_index "employees", ["title"], name: "index_employees_on_title", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "key"
    t.string   "name"
    t.integer  "company_id"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "locations", ["company_id"], name: "index_locations_on_company_id", using: :btree
  add_index "locations", ["employee_id"], name: "index_locations_on_employee_id", using: :btree
  add_index "locations", ["key"], name: "index_locations_on_key", using: :btree
  add_index "locations", ["name"], name: "index_locations_on_name", using: :btree

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
  add_index "products", ["type"], name: "index_products_on_type", using: :btree
  add_index "products", ["type_display"], name: "index_products_on_type_display", using: :btree

  create_table "specs", force: :cascade do |t|
    t.string   "key"
    t.string   "title"
    t.text     "body"
    t.integer  "parent_id"
    t.string   "parent_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "specs", ["body"], name: "index_specs_on_body", using: :btree
  add_index "specs", ["key"], name: "index_specs_on_key", using: :btree
  add_index "specs", ["parent_id", "parent_type"], name: "index_specs_on_parent_id_and_parent_type", using: :btree
  add_index "specs", ["parent_id"], name: "index_specs_on_parent_id", using: :btree
  add_index "specs", ["parent_type"], name: "index_specs_on_parent_type", using: :btree
  add_index "specs", ["title"], name: "index_specs_on_title", using: :btree

  add_foreign_key "locations", "companies"
  add_foreign_key "locations", "employees"
end
