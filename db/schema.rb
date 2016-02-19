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

ActiveRecord::Schema.define(version: 20160216155423) do

  create_table "trend_videos", id: false, force: :cascade do |t|
    t.string   "vid",         limit: 255,  null: false
    t.string   "title",       limit: 1023, null: false
    t.string   "channel",     limit: 255,  null: false
    t.integer  "view_cnt",    limit: 4,    null: false
    t.integer  "like_cnt",    limit: 4,    null: false
    t.integer  "dislike_cnt", limit: 4,    null: false
    t.integer  "fav_cnt",     limit: 4,    null: false
    t.integer  "comment_cnt", limit: 4,    null: false
    t.date     "trend_date",               null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "tw_data_20160206", force: :cascade do |t|
    t.integer  "uid",          limit: 8,     null: false
    t.string   "user_name",    limit: 255,   null: false
    t.string   "nickname",     limit: 255,   null: false
    t.binary   "body",         limit: 65535, null: false
    t.datetime "ts",                         null: false
    t.date     "ts_date",                    null: false
    t.string   "tool",         limit: 255,   null: false
    t.string   "url",          limit: 1023,  null: false
    t.integer  "rt_id",        limit: 8,     null: false
    t.integer  "rt_user_id",   limit: 8,     null: false
    t.integer  "rt_cnt",       limit: 4,     null: false
    t.integer  "like_cnt",     limit: 4,     null: false
    t.float    "lat",          limit: 24,    null: false
    t.float    "lon",          limit: 24,    null: false
    t.integer  "cnt",          limit: 4,     null: false
    t.integer  "friend_cnt",   limit: 4,     null: false
    t.integer  "follower_cnt", limit: 4,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tw_data_20160206", ["url"], name: "index_tw_data_20160206_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160207", force: :cascade do |t|
    t.integer  "uid",          limit: 8,     null: false
    t.string   "user_name",    limit: 255,   null: false
    t.string   "nickname",     limit: 255,   null: false
    t.binary   "body",         limit: 65535, null: false
    t.datetime "ts",                         null: false
    t.date     "ts_date",                    null: false
    t.string   "tool",         limit: 255,   null: false
    t.string   "url",          limit: 1023,  null: false
    t.integer  "rt_id",        limit: 8,     null: false
    t.integer  "rt_user_id",   limit: 8,     null: false
    t.integer  "rt_cnt",       limit: 4,     null: false
    t.integer  "like_cnt",     limit: 4,     null: false
    t.float    "lat",          limit: 24,    null: false
    t.float    "lon",          limit: 24,    null: false
    t.integer  "cnt",          limit: 4,     null: false
    t.integer  "friend_cnt",   limit: 4,     null: false
    t.integer  "follower_cnt", limit: 4,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tw_data_20160207", ["url"], name: "index_tw_data_20160207_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160208", force: :cascade do |t|
    t.integer  "uid",          limit: 8,     null: false
    t.string   "user_name",    limit: 255,   null: false
    t.string   "nickname",     limit: 255,   null: false
    t.binary   "body",         limit: 65535, null: false
    t.datetime "ts",                         null: false
    t.date     "ts_date",                    null: false
    t.string   "tool",         limit: 255,   null: false
    t.string   "url",          limit: 1023,  null: false
    t.integer  "rt_id",        limit: 8,     null: false
    t.integer  "rt_user_id",   limit: 8,     null: false
    t.integer  "rt_cnt",       limit: 4,     null: false
    t.integer  "like_cnt",     limit: 4,     null: false
    t.float    "lat",          limit: 24,    null: false
    t.float    "lon",          limit: 24,    null: false
    t.integer  "cnt",          limit: 4,     null: false
    t.integer  "friend_cnt",   limit: 4,     null: false
    t.integer  "follower_cnt", limit: 4,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tw_data_20160208", ["url"], name: "index_tw_data_20160208_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160209", force: :cascade do |t|
    t.integer  "uid",          limit: 8,     null: false
    t.string   "user_name",    limit: 255,   null: false
    t.string   "nickname",     limit: 255,   null: false
    t.binary   "body",         limit: 65535, null: false
    t.datetime "ts",                         null: false
    t.date     "ts_date",                    null: false
    t.string   "tool",         limit: 255,   null: false
    t.string   "url",          limit: 1023,  null: false
    t.integer  "rt_id",        limit: 8,     null: false
    t.integer  "rt_user_id",   limit: 8,     null: false
    t.integer  "rt_cnt",       limit: 4,     null: false
    t.integer  "like_cnt",     limit: 4,     null: false
    t.float    "lat",          limit: 24,    null: false
    t.float    "lon",          limit: 24,    null: false
    t.integer  "cnt",          limit: 4,     null: false
    t.integer  "friend_cnt",   limit: 4,     null: false
    t.integer  "follower_cnt", limit: 4,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tw_data_20160209", ["url"], name: "index_tw_data_20160209_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160210", force: :cascade do |t|
    t.integer  "uid",          limit: 8,     null: false
    t.string   "user_name",    limit: 255,   null: false
    t.string   "nickname",     limit: 255,   null: false
    t.binary   "body",         limit: 65535, null: false
    t.datetime "ts",                         null: false
    t.date     "ts_date",                    null: false
    t.string   "tool",         limit: 255,   null: false
    t.string   "url",          limit: 1023,  null: false
    t.integer  "rt_id",        limit: 8,     null: false
    t.integer  "rt_user_id",   limit: 8,     null: false
    t.integer  "rt_cnt",       limit: 4,     null: false
    t.integer  "like_cnt",     limit: 4,     null: false
    t.float    "lat",          limit: 24,    null: false
    t.float    "lon",          limit: 24,    null: false
    t.integer  "cnt",          limit: 4,     null: false
    t.integer  "friend_cnt",   limit: 4,     null: false
    t.integer  "follower_cnt", limit: 4,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tw_data_20160210", ["url"], name: "index_tw_data_20160210_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160211", force: :cascade do |t|
    t.integer  "uid",          limit: 8,     null: false
    t.string   "user_name",    limit: 255,   null: false
    t.string   "nickname",     limit: 255,   null: false
    t.binary   "body",         limit: 65535, null: false
    t.datetime "ts",                         null: false
    t.date     "ts_date",                    null: false
    t.string   "tool",         limit: 255,   null: false
    t.string   "url",          limit: 1023,  null: false
    t.integer  "rt_id",        limit: 8,     null: false
    t.integer  "rt_user_id",   limit: 8,     null: false
    t.integer  "rt_cnt",       limit: 4,     null: false
    t.integer  "like_cnt",     limit: 4,     null: false
    t.float    "lat",          limit: 24,    null: false
    t.float    "lon",          limit: 24,    null: false
    t.integer  "cnt",          limit: 4,     null: false
    t.integer  "friend_cnt",   limit: 4,     null: false
    t.integer  "follower_cnt", limit: 4,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tw_data_20160211", ["url"], name: "index_tw_data_20160211_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160212", force: :cascade do |t|
    t.integer  "uid",          limit: 8,     null: false
    t.string   "user_name",    limit: 255,   null: false
    t.string   "nickname",     limit: 255,   null: false
    t.binary   "body",         limit: 65535, null: false
    t.datetime "ts",                         null: false
    t.date     "ts_date",                    null: false
    t.string   "tool",         limit: 255,   null: false
    t.string   "url",          limit: 1023,  null: false
    t.integer  "rt_id",        limit: 8,     null: false
    t.integer  "rt_user_id",   limit: 8,     null: false
    t.integer  "rt_cnt",       limit: 4,     null: false
    t.integer  "like_cnt",     limit: 4,     null: false
    t.float    "lat",          limit: 24,    null: false
    t.float    "lon",          limit: 24,    null: false
    t.integer  "cnt",          limit: 4,     null: false
    t.integer  "friend_cnt",   limit: 4,     null: false
    t.integer  "follower_cnt", limit: 4,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tw_data_20160212", ["url"], name: "index_tw_data_20160212_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160213", force: :cascade do |t|
    t.integer  "uid",          limit: 8,     null: false
    t.string   "user_name",    limit: 255,   null: false
    t.string   "nickname",     limit: 255,   null: false
    t.binary   "body",         limit: 65535, null: false
    t.datetime "ts",                         null: false
    t.date     "ts_date",                    null: false
    t.string   "tool",         limit: 255,   null: false
    t.string   "url",          limit: 1023,  null: false
    t.integer  "rt_id",        limit: 8,     null: false
    t.integer  "rt_user_id",   limit: 8,     null: false
    t.integer  "rt_cnt",       limit: 4,     null: false
    t.integer  "like_cnt",     limit: 4,     null: false
    t.float    "lat",          limit: 24,    null: false
    t.float    "lon",          limit: 24,    null: false
    t.integer  "cnt",          limit: 4,     null: false
    t.integer  "friend_cnt",   limit: 4,     null: false
    t.integer  "follower_cnt", limit: 4,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tw_data_20160213", ["url"], name: "index_tw_data_20160213_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160214", force: :cascade do |t|
    t.integer  "uid",          limit: 8,     null: false
    t.string   "user_name",    limit: 255,   null: false
    t.string   "nickname",     limit: 255,   null: false
    t.binary   "body",         limit: 65535, null: false
    t.datetime "ts",                         null: false
    t.date     "ts_date",                    null: false
    t.string   "tool",         limit: 255,   null: false
    t.string   "url",          limit: 1023,  null: false
    t.integer  "rt_id",        limit: 8,     null: false
    t.integer  "rt_user_id",   limit: 8,     null: false
    t.integer  "rt_cnt",       limit: 4,     null: false
    t.integer  "like_cnt",     limit: 4,     null: false
    t.float    "lat",          limit: 24,    null: false
    t.float    "lon",          limit: 24,    null: false
    t.integer  "cnt",          limit: 4,     null: false
    t.integer  "friend_cnt",   limit: 4,     null: false
    t.integer  "follower_cnt", limit: 4,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tw_data_20160214", ["url"], name: "index_tw_data_20160214_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160215", force: :cascade do |t|
    t.integer  "uid",          limit: 8,     null: false
    t.string   "user_name",    limit: 255,   null: false
    t.string   "nickname",     limit: 255,   null: false
    t.binary   "body",         limit: 65535, null: false
    t.datetime "ts",                         null: false
    t.date     "ts_date",                    null: false
    t.string   "tool",         limit: 255,   null: false
    t.string   "url",          limit: 1023,  null: false
    t.integer  "rt_id",        limit: 8,     null: false
    t.integer  "rt_user_id",   limit: 8,     null: false
    t.integer  "rt_cnt",       limit: 4,     null: false
    t.integer  "like_cnt",     limit: 4,     null: false
    t.float    "lat",          limit: 24,    null: false
    t.float    "lon",          limit: 24,    null: false
    t.integer  "cnt",          limit: 4,     null: false
    t.integer  "friend_cnt",   limit: 4,     null: false
    t.integer  "follower_cnt", limit: 4,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tw_data_20160215", ["url"], name: "index_tw_data_20160215_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160216", force: :cascade do |t|
    t.integer  "uid",          limit: 8,     null: false
    t.string   "user_name",    limit: 255,   null: false
    t.string   "nickname",     limit: 255,   null: false
    t.binary   "body",         limit: 65535, null: false
    t.datetime "ts",                         null: false
    t.date     "ts_date",                    null: false
    t.string   "tool",         limit: 255,   null: false
    t.string   "url",          limit: 1023,  null: false
    t.integer  "rt_id",        limit: 8,     null: false
    t.integer  "rt_user_id",   limit: 8,     null: false
    t.integer  "rt_cnt",       limit: 4,     null: false
    t.integer  "like_cnt",     limit: 4,     null: false
    t.float    "lat",          limit: 24,    null: false
    t.float    "lon",          limit: 24,    null: false
    t.integer  "cnt",          limit: 4,     null: false
    t.integer  "friend_cnt",   limit: 4,     null: false
    t.integer  "follower_cnt", limit: 4,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tw_data_20160216", ["url"], name: "index_tw_data_20160216_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160217", force: :cascade do |t|
    t.integer  "uid",          limit: 8,     null: false
    t.string   "user_name",    limit: 255,   null: false
    t.string   "nickname",     limit: 255,   null: false
    t.binary   "body",         limit: 65535, null: false
    t.datetime "ts",                         null: false
    t.date     "ts_date",                    null: false
    t.string   "tool",         limit: 255,   null: false
    t.string   "url",          limit: 1023,  null: false
    t.integer  "rt_id",        limit: 8,     null: false
    t.integer  "rt_user_id",   limit: 8,     null: false
    t.integer  "rt_cnt",       limit: 4,     null: false
    t.integer  "like_cnt",     limit: 4,     null: false
    t.float    "lat",          limit: 24,    null: false
    t.float    "lon",          limit: 24,    null: false
    t.integer  "cnt",          limit: 4,     null: false
    t.integer  "friend_cnt",   limit: 4,     null: false
    t.integer  "follower_cnt", limit: 4,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tw_data_20160217", ["url"], name: "index_tw_data_20160217_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160218", force: :cascade do |t|
    t.integer  "uid",          limit: 8,     null: false
    t.string   "user_name",    limit: 255,   null: false
    t.string   "nickname",     limit: 255,   null: false
    t.binary   "body",         limit: 65535, null: false
    t.datetime "ts",                         null: false
    t.date     "ts_date",                    null: false
    t.string   "tool",         limit: 255,   null: false
    t.string   "url",          limit: 1023,  null: false
    t.integer  "rt_id",        limit: 8,     null: false
    t.integer  "rt_user_id",   limit: 8,     null: false
    t.integer  "rt_cnt",       limit: 4,     null: false
    t.integer  "like_cnt",     limit: 4,     null: false
    t.float    "lat",          limit: 24,    null: false
    t.float    "lon",          limit: 24,    null: false
    t.integer  "cnt",          limit: 4,     null: false
    t.integer  "friend_cnt",   limit: 4,     null: false
    t.integer  "follower_cnt", limit: 4,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tw_data_20160218", ["url"], name: "index_tw_data_20160218_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160219", force: :cascade do |t|
    t.integer  "uid",          limit: 8,     null: false
    t.string   "user_name",    limit: 255,   null: false
    t.string   "nickname",     limit: 255,   null: false
    t.binary   "body",         limit: 65535, null: false
    t.datetime "ts",                         null: false
    t.date     "ts_date",                    null: false
    t.string   "tool",         limit: 255,   null: false
    t.string   "url",          limit: 1023,  null: false
    t.integer  "rt_id",        limit: 8,     null: false
    t.integer  "rt_user_id",   limit: 8,     null: false
    t.integer  "rt_cnt",       limit: 4,     null: false
    t.integer  "like_cnt",     limit: 4,     null: false
    t.float    "lat",          limit: 24,    null: false
    t.float    "lon",          limit: 24,    null: false
    t.integer  "cnt",          limit: 4,     null: false
    t.integer  "friend_cnt",   limit: 4,     null: false
    t.integer  "follower_cnt", limit: 4,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tw_data_20160219", ["url"], name: "index_tw_data_20160219_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160220", force: :cascade do |t|
    t.integer  "uid",          limit: 8,     null: false
    t.string   "user_name",    limit: 255,   null: false
    t.string   "nickname",     limit: 255,   null: false
    t.binary   "body",         limit: 65535, null: false
    t.datetime "ts",                         null: false
    t.date     "ts_date",                    null: false
    t.string   "tool",         limit: 255,   null: false
    t.string   "url",          limit: 1023,  null: false
    t.integer  "rt_id",        limit: 8,     null: false
    t.integer  "rt_user_id",   limit: 8,     null: false
    t.integer  "rt_cnt",       limit: 4,     null: false
    t.integer  "like_cnt",     limit: 4,     null: false
    t.float    "lat",          limit: 24,    null: false
    t.float    "lon",          limit: 24,    null: false
    t.integer  "cnt",          limit: 4,     null: false
    t.integer  "friend_cnt",   limit: 4,     null: false
    t.integer  "follower_cnt", limit: 4,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tw_data_20160220", ["url"], name: "index_tw_data_20160220_on_url", length: {"url"=>333}, using: :btree

  create_table "videos", primary_key: "vid", force: :cascade do |t|
    t.string   "title",       limit: 1023, null: false
    t.string   "channel",     limit: 255,  null: false
    t.integer  "view_cnt",    limit: 4,    null: false
    t.integer  "like_cnt",    limit: 4,    null: false
    t.integer  "dislike_cnt", limit: 4,    null: false
    t.integer  "fav_cnt",     limit: 4,    null: false
    t.integer  "comment_cnt", limit: 4,    null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
