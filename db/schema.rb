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

ActiveRecord::Schema.define(version: 20170806135727) do

  create_table "attempt_cases", force: :cascade do |t|
    t.integer "attempt_id"
    t.integer "case_id"
    t.integer "exec_time"
    t.integer "exec_mem"
    t.string "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attempt_id"], name: "index_attempt_cases_on_attempt_id"
    t.index ["case_id"], name: "index_attempt_cases_on_case_id"
  end

  create_table "attempts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "problem_id"
    t.string "language"
    t.text "code"
    t.string "result"
    t.integer "answer_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "attempted_at"
    t.datetime "submitted_at"
    t.index ["problem_id"], name: "index_attempts_on_problem_id"
    t.index ["user_id"], name: "index_attempts_on_user_id"
  end

  create_table "cases", force: :cascade do |t|
    t.integer "problem_id"
    t.text "input"
    t.text "expected"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["problem_id"], name: "index_cases_on_problem_id"
  end

  create_table "problems", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.text "description"
    t.integer "version"
    t.string "publish_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_problems_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
