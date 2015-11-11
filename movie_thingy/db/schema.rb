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

ActiveRecord::Schema.define(version: 20151111222900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "review_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["review_id"], name: "index_comments_on_review_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string   "genre_id"
    t.string   "title"
    t.string   "director"
    t.integer  "release_year"
    t.integer  "runtime"
    t.string   "mppa_rating"
    t.text     "cast"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.string   "name"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "ratings", ["rateable_id"], name: "index_ratings_on_rateable_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "user_id"
    t.text     "content"
    t.integer  "photography"
    t.integer  "directing"
    t.integer  "cast"
    t.integer  "score"
    t.integer  "overall_effect"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.text     "bio"
    t.boolean  "admin"
    t.boolean  "trusted_user"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_foreign_key "comments", "reviews"
  add_foreign_key "comments", "users"
end
