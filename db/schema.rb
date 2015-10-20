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

ActiveRecord::Schema.define(version: 20151020124823) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "fields", force: :cascade do |t|
    t.string "name"
  end

  create_table "members", force: :cascade do |t|
    t.string  "name"
    t.string  "email"
    t.string  "phone"
    t.string  "organization"
    t.text    "address"
    t.string  "affiliation"
    t.string  "link"
    t.string  "image_id"
    t.string  "function"
    t.string  "slug"
    t.integer "position"
    t.string  "image_content_type"
  end

  create_table "news_articles", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.string   "image_id"
    t.string   "document_id"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "document_filename"
    t.integer  "news_category_id"
    t.string   "image_content_type"
  end

  add_index "news_articles", ["news_category_id"], name: "index_news_articles_on_news_category_id", using: :btree

  create_table "news_categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "publications", force: :cascade do |t|
    t.string   "title"
    t.string   "link"
    t.string   "document_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document_filename"
    t.integer  "year"
  end

  add_index "publications", ["category_id"], name: "index_publications_on_category_id", using: :btree

  create_table "stakeholders", force: :cascade do |t|
    t.string  "name"
    t.string  "link"
    t.integer "field_id"
  end

  add_index "stakeholders", ["field_id"], name: "index_stakeholders_on_field_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
  end

  add_foreign_key "publications", "categories"
  add_foreign_key "stakeholders", "fields"
end
