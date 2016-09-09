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

ActiveRecord::Schema.define(version: 20160909163549) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "slug"
    t.string   "company_logo_uid"
  end

  create_table "created_business_cards", force: :cascade do |t|
    t.string   "holder_name"
    t.string   "holder_name2"
    t.string   "company"
    t.string   "division"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "divisions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "image_uid"
    t.string   "image_back_uid"
    t.string   "image_cut_uid"
    t.string   "image_preview_front_uid"
    t.string   "image_preview_back_uid"
    t.integer  "company_id"
    t.string   "slug"
    t.string   "head_email_address"
    t.integer  "order"
    t.string   "head_name"
  end

  create_table "divisions_input_fields", id: false, force: :cascade do |t|
    t.integer "division_id",    null: false
    t.integer "input_field_id", null: false
  end

  create_table "fonts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "input_fields", force: :cascade do |t|
    t.float    "x_pos"
    t.float    "y_pos"
    t.string   "size"
    t.string   "colour"
    t.string   "weight"
    t.string   "align"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "field_name"
    t.integer  "font_id"
    t.string   "prefix"
    t.string   "default"
    t.integer  "order"
  end

end
