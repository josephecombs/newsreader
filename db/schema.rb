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

ActiveRecord::Schema.define(version: 20140916223712) do

  create_table "entries", force: true do |t|
    t.string   "guid",         null: false
    t.string   "link",         null: false
    t.string   "title",        null: false
    t.datetime "published_at", null: false
    t.integer  "feed_id",      null: false
    t.text     "json",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entries", ["feed_id"], name: "index_entries_on_feed_id"
  add_index "entries", ["guid"], name: "index_entries_on_guid", unique: true

  create_table "feeds", force: true do |t|
    t.string   "url",        null: false
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feeds", ["url"], name: "index_feeds_on_url", unique: true

  create_table "user_favorite_entries", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "entry_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_favorite_entries", ["entry_id"], name: "index_user_favorite_entries_on_entry_id"
  add_index "user_favorite_entries", ["user_id", "entry_id"], name: "index_user_favorite_entries_on_user_id_and_entry_id", unique: true
  add_index "user_favorite_entries", ["user_id"], name: "index_user_favorite_entries_on_user_id"

  create_table "user_favorite_feeds", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "feed_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_favorite_feeds", ["feed_id"], name: "index_user_favorite_feeds_on_feed_id"
  add_index "user_favorite_feeds", ["user_id", "feed_id"], name: "index_user_favorite_feeds_on_user_id_and_feed_id", unique: true
  add_index "user_favorite_feeds", ["user_id"], name: "index_user_favorite_feeds_on_user_id"

  create_table "user_feeds", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "feed_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_feeds", ["feed_id"], name: "index_user_feeds_on_feed_id"
  add_index "user_feeds", ["user_id", "feed_id"], name: "index_user_feeds_on_user_id_and_feed_id", unique: true
  add_index "user_feeds", ["user_id"], name: "index_user_feeds_on_user_id"

  create_table "users", force: true do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
