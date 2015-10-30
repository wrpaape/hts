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

ActiveRecord::Schema.define(version: 20151030214149) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assets", force: :cascade do |t|
    t.string   "key"
    t.string   "type"
    t.string   "class_name",   default: ""
    t.string   "description"
    t.string   "filename",     default: ""
    t.string   "path_file"
    t.string   "path_default"
    t.string   "path_link"
    t.integer  "parent_id"
    t.string   "parent_type"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "assets", ["class_name"], name: "index_assets_on_class_name", using: :btree
  add_index "assets", ["description"], name: "index_assets_on_description", using: :btree
  add_index "assets", ["filename"], name: "index_assets_on_filename", using: :btree
  add_index "assets", ["key"], name: "index_assets_on_key", using: :btree
  add_index "assets", ["parent_id", "parent_type"], name: "index_assets_on_parent_id_and_parent_type", using: :btree
  add_index "assets", ["parent_id"], name: "index_assets_on_parent_id", using: :btree
  add_index "assets", ["parent_type"], name: "index_assets_on_parent_type", using: :btree
  add_index "assets", ["path_default"], name: "index_assets_on_path_default", using: :btree
  add_index "assets", ["path_file"], name: "index_assets_on_path_file", using: :btree
  add_index "assets", ["path_link"], name: "index_assets_on_path_link", using: :btree
  add_index "assets", ["type"], name: "index_assets_on_type", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "key"
    t.string   "type_display"
    t.string   "name"
    t.string   "slogan"
    t.string   "path_show"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "companies", ["key"], name: "index_companies_on_key", using: :btree
  add_index "companies", ["name"], name: "index_companies_on_name", using: :btree
  add_index "companies", ["path_show"], name: "index_companies_on_path_show", using: :btree
  add_index "companies", ["slogan"], name: "index_companies_on_slogan", using: :btree
  add_index "companies", ["type_display"], name: "index_companies_on_type_display", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "key"
    t.string   "type"
    t.string   "type_display"
    t.boolean  "primary",      default: true
    t.string   "info1"
    t.string   "info2"
    t.string   "info3"
    t.string   "info4"
    t.string   "parent_type"
    t.integer  "parent_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
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
  add_index "contacts", ["type_display"], name: "index_contacts_on_type_display", using: :btree

  create_table "docs", force: :cascade do |t|
    t.string   "key"
    t.string   "type"
    t.string   "type_display"
    t.string   "title"
    t.text     "body"
    t.string   "path_show"
    t.integer  "parent_id"
    t.string   "parent_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "docs", ["body"], name: "index_docs_on_body", using: :btree
  add_index "docs", ["key"], name: "index_docs_on_key", using: :btree
  add_index "docs", ["parent_id", "parent_type"], name: "index_docs_on_parent_id_and_parent_type", using: :btree
  add_index "docs", ["parent_id"], name: "index_docs_on_parent_id", using: :btree
  add_index "docs", ["parent_type"], name: "index_docs_on_parent_type", using: :btree
  add_index "docs", ["path_show"], name: "index_docs_on_path_show", using: :btree
  add_index "docs", ["title"], name: "index_docs_on_title", using: :btree
  add_index "docs", ["type"], name: "index_docs_on_type", using: :btree
  add_index "docs", ["type_display"], name: "index_docs_on_type_display", using: :btree

  create_table "employees", force: :cascade do |t|
    t.string   "key"
    t.string   "type_display"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "full_name"
    t.string   "path_show"
    t.string   "job_title"
    t.text     "bio"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "employees", ["bio"], name: "index_employees_on_bio", using: :btree
  add_index "employees", ["first_name"], name: "index_employees_on_first_name", using: :btree
  add_index "employees", ["full_name"], name: "index_employees_on_full_name", using: :btree
  add_index "employees", ["job_title"], name: "index_employees_on_job_title", using: :btree
  add_index "employees", ["key"], name: "index_employees_on_key", using: :btree
  add_index "employees", ["last_name"], name: "index_employees_on_last_name", using: :btree
  add_index "employees", ["middle_name"], name: "index_employees_on_middle_name", using: :btree
  add_index "employees", ["path_show"], name: "index_employees_on_path_show", using: :btree
  add_index "employees", ["type_display"], name: "index_employees_on_type_display", using: :btree

  create_table "parts", force: :cascade do |t|
    t.string   "key"
    t.string   "name"
    t.string   "number"
    t.integer  "prod_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "parts", ["key"], name: "index_parts_on_key", using: :btree
  add_index "parts", ["name"], name: "index_parts_on_name", using: :btree
  add_index "parts", ["number"], name: "index_parts_on_number", using: :btree
  add_index "parts", ["prod_id"], name: "index_parts_on_prod_id", using: :btree

  create_table "prods", force: :cascade do |t|
    t.string   "key"
    t.string   "type"
    t.string   "model_number"
    t.string   "type_display"
    t.string   "name"
    t.string   "path_show"
    t.text     "info"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "prods", ["info"], name: "index_prods_on_info", using: :btree
  add_index "prods", ["key"], name: "index_prods_on_key", using: :btree
  add_index "prods", ["model_number"], name: "index_prods_on_model_number", using: :btree
  add_index "prods", ["name"], name: "index_prods_on_name", using: :btree
  add_index "prods", ["path_show"], name: "index_prods_on_path_show", using: :btree
  add_index "prods", ["type"], name: "index_prods_on_type", using: :btree
  add_index "prods", ["type_display"], name: "index_prods_on_type_display", using: :btree

  create_table "texts", force: :cascade do |t|
    t.string   "key"
    t.string   "type"
    t.string   "title"
    t.text     "body"
    t.integer  "parent_id"
    t.string   "parent_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "texts", ["body"], name: "index_texts_on_body", using: :btree
  add_index "texts", ["key"], name: "index_texts_on_key", using: :btree
  add_index "texts", ["parent_id", "parent_type"], name: "index_texts_on_parent_id_and_parent_type", using: :btree
  add_index "texts", ["parent_id"], name: "index_texts_on_parent_id", using: :btree
  add_index "texts", ["parent_type"], name: "index_texts_on_parent_type", using: :btree
  add_index "texts", ["title"], name: "index_texts_on_title", using: :btree
  add_index "texts", ["type"], name: "index_texts_on_type", using: :btree

  add_foreign_key "parts", "prods"
end
