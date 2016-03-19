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

ActiveRecord::Schema.define(version: 20160314162055) do

  create_table "channels", primary_key: "cid", force: :cascade do |t|
    t.string   "title",          limit: 1023,  null: false
    t.text     "description",    limit: 65535, null: false
    t.datetime "published_at",                 null: false
    t.string   "img_url",        limit: 255,   null: false
    t.integer  "view_cnt",       limit: 4,     null: false
    t.integer  "comment_cnt",    limit: 4,     null: false
    t.integer  "subscriber_cnt", limit: 4,     null: false
    t.integer  "video_cnt",      limit: 4,     null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "trend_videos", id: false, force: :cascade do |t|
    t.string   "vid",           limit: 255,               null: false
    t.string   "title",         limit: 1023,              null: false
    t.string   "channel",       limit: 255,               null: false
    t.string   "channel_title", limit: 255,               null: false
    t.integer  "category_id",   limit: 4,     default: 0, null: false
    t.text     "tags",          limit: 65535,             null: false
    t.integer  "view_cnt",      limit: 4,                 null: false
    t.integer  "like_cnt",      limit: 4,                 null: false
    t.integer  "dislike_cnt",   limit: 4,                 null: false
    t.integer  "fav_cnt",       limit: 4,                 null: false
    t.integer  "comment_cnt",   limit: 4,                 null: false
    t.date     "trend_date",                              null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "tw_data_20160301", force: :cascade do |t|
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

  add_index "tw_data_20160301", ["url"], name: "index_tw_data_20160301_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160302", force: :cascade do |t|
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

  add_index "tw_data_20160302", ["url"], name: "index_tw_data_20160302_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160303", force: :cascade do |t|
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

  add_index "tw_data_20160303", ["url"], name: "index_tw_data_20160303_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160304", force: :cascade do |t|
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

  add_index "tw_data_20160304", ["url"], name: "index_tw_data_20160304_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160305", force: :cascade do |t|
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

  add_index "tw_data_20160305", ["url"], name: "index_tw_data_20160305_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160306", force: :cascade do |t|
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

  add_index "tw_data_20160306", ["url"], name: "index_tw_data_20160306_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160307", force: :cascade do |t|
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

  add_index "tw_data_20160307", ["url"], name: "index_tw_data_20160307_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160308", force: :cascade do |t|
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

  add_index "tw_data_20160308", ["url"], name: "index_tw_data_20160308_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160309", force: :cascade do |t|
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

  add_index "tw_data_20160309", ["url"], name: "index_tw_data_20160309_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160310", force: :cascade do |t|
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

  add_index "tw_data_20160310", ["url"], name: "index_tw_data_20160310_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160311", force: :cascade do |t|
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

  add_index "tw_data_20160311", ["url"], name: "index_tw_data_20160311_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160312", force: :cascade do |t|
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

  add_index "tw_data_20160312", ["url"], name: "index_tw_data_20160312_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160313", force: :cascade do |t|
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

  add_index "tw_data_20160313", ["url"], name: "index_tw_data_20160313_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160314", force: :cascade do |t|
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

  add_index "tw_data_20160314", ["url"], name: "index_tw_data_20160314_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160315", force: :cascade do |t|
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

  add_index "tw_data_20160315", ["url"], name: "index_tw_data_20160315_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160316", force: :cascade do |t|
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

  add_index "tw_data_20160316", ["url"], name: "index_tw_data_20160316_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160317", force: :cascade do |t|
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

  add_index "tw_data_20160317", ["url"], name: "index_tw_data_20160317_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160318", force: :cascade do |t|
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

  add_index "tw_data_20160318", ["url"], name: "index_tw_data_20160318_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160319", force: :cascade do |t|
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

  add_index "tw_data_20160319", ["url"], name: "index_tw_data_20160319_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160320", force: :cascade do |t|
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

  add_index "tw_data_20160320", ["url"], name: "index_tw_data_20160320_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160321", force: :cascade do |t|
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

  add_index "tw_data_20160321", ["url"], name: "index_tw_data_20160321_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160322", force: :cascade do |t|
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

  add_index "tw_data_20160322", ["url"], name: "index_tw_data_20160322_on_url", length: {"url"=>333}, using: :btree

  create_table "tw_data_20160323", force: :cascade do |t|
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

  add_index "tw_data_20160323", ["url"], name: "index_tw_data_20160323_on_url", length: {"url"=>333}, using: :btree

  create_table "twicas", primary_key: "mid", force: :cascade do |t|
    t.string   "uid",             limit: 255,  null: false
    t.string   "title",           limit: 1023, null: false
    t.string   "localized_title", limit: 1023, null: false
    t.string   "url",             limit: 1023, null: false
    t.boolean  "islive",                       null: false
    t.string   "img_url",         limit: 1023, null: false
    t.integer  "comment_cnt",     limit: 4,    null: false
    t.integer  "total_cnt",       limit: 4,    null: false
    t.integer  "viewer_cnt",      limit: 4,    null: false
    t.datetime "broadcasted_at",               null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "twicas", ["islive"], name: "index_twicas_on_islive", using: :btree

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
