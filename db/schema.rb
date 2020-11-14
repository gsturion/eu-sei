# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_14_141343) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alternatives", force: :cascade do |t|
    t.text "content"
    t.boolean "is_correct"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "question_id", null: false
    t.index ["question_id"], name: "index_alternatives_on_question_id"
  end

  create_table "answers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "alternative_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["alternative_id"], name: "index_answers_on_alternative_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "classrooms", force: :cascade do |t|
    t.string "class"
    t.integer "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text "content"
    t.integer "lesson"
    t.datetime "released_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "classroom_id", null: false
    t.bigint "user_id", null: false
    t.index ["classroom_id"], name: "index_questions_on_classroom_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_teacher"
    t.string "name"
    t.string "subject"
    t.bigint "classroom_id", null: false
    t.index ["classroom_id"], name: "index_users_on_classroom_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "alternatives", "questions"
  add_foreign_key "answers", "alternatives"
  add_foreign_key "answers", "users"
  add_foreign_key "questions", "classrooms"
  add_foreign_key "questions", "users"
  add_foreign_key "users", "classrooms"
end
