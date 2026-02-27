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

ActiveRecord::Schema[8.1].define(version: 2026_02_22_210134) do
  create_table "answers", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.text "name"
    t.integer "question_id"
    t.datetime "updated_at", null: false
  end

  create_table "board_messages", force: :cascade do |t|
    t.integer "board_user_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.integer "parent_id"
    t.datetime "updated_at", null: false
  end

  create_table "board_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "memo"
    t.text "nickname"
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "cards", force: :cascade do |t|
    t.text "author"
    t.datetime "created_at", null: false
    t.text "memo"
    t.integer "price"
    t.text "publisher"
    t.text "title"
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.integer "parent_id"
    t.integer "post_id"
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "messages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "message"
    t.integer "person_id"
    t.text "title"
    t.datetime "updated_at", null: false
  end

  create_table "mycontacts", force: :cascade do |t|
    t.integer "age"
    t.datetime "created_at", null: false
    t.text "mail"
    t.text "name"
    t.boolean "nationality"
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.integer "age"
    t.datetime "created_at", null: false
    t.text "mail"
    t.text "name"
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.boolean "finished"
    t.text "name"
    t.text "title"
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "sessions", "users"
end
