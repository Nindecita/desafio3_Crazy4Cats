# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_26_211319) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aventures", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "image"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_aventures_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.boolean "anonimus", default: false
    t.string "comment", default: ""
    t.bigint "user_id"
    t.bigint "aventure_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aventure_id"], name: "index_comments_on_aventure_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "comments_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comments_id"], name: "index_likes_on_comments_id"
    t.index ["user_id", "comments_id"], name: "index_likes_on_user_id_and_comments_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string "name", default: ""
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "aventures", "users"
  add_foreign_key "comments", "aventures"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "comments", column: "comments_id"
  add_foreign_key "likes", "users"
end
