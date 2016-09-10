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

ActiveRecord::Schema.define(version: 20160910060543) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "business_card_fields", force: :cascade do |t|
    t.string   "name"
    t.float    "x_pos"
    t.float    "y_pos"
    t.string   "size"
    t.string   "colour"
    t.string   "weight"
    t.string   "align"
    t.integer  "font_id"
    t.string   "prefix"
    t.string   "default"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "business_card_fields_divisions", id: false, force: :cascade do |t|
    t.integer "division_id",            null: false
    t.integer "business_card_field_id", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "company_logo_uid"
  end

  create_table "divisions", force: :cascade do |t|
    t.string   "name"
    t.string   "image_uid"
    t.string   "image_back_uid"
    t.string   "image_cut_uid"
    t.string   "image_preview_front_uid"
    t.string   "image_preview_back_uid"
    t.integer  "company_id"
    t.string   "slug"
    t.string   "head_email_address"
    t.string   "head_name"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "order"
    t.string   "email_sig_template_file_name"
    t.string   "email_sig_template_content_type"
    t.integer  "email_sig_template_file_size"
    t.datetime "email_sig_template_updated_at"
  end

  create_table "divisions_email_sig_fields", id: false, force: :cascade do |t|
    t.integer "division_id",        null: false
    t.integer "email_sig_field_id", null: false
  end

  create_table "email_sig_fields", force: :cascade do |t|
    t.string   "content"
    t.integer  "order"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "replace_field"
  end

  create_table "fonts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
