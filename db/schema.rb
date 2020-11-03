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

ActiveRecord::Schema.define(version: 2020_11_02_124148) do

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id"
    t.bigint "myserif_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["myserif_id"], name: "index_comments_on_myserif_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "myserif_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["myserif_id"], name: "index_favorites_on_myserif_id"
    t.index ["user_id", "myserif_id"], name: "index_favorites_on_user_id_and_myserif_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "myserifs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "content"
    t.string "title"
    t.string "character"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "genre_id"
    t.string "genre"
    t.index ["user_id"], name: "index_myserifs_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "myserifs"
  add_foreign_key "comments", "users"
  add_foreign_key "favorites", "myserifs"
  add_foreign_key "favorites", "users"
  add_foreign_key "myserifs", "users"
end
