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

ActiveRecord::Schema.define(version: 2021_07_28_000546) do

  create_table "millionaire_questions", force: :cascade do |t|
    t.string "question"
    t.string "a"
    t.string "b"
    t.string "c"
    t.string "d"
    t.string "answer"
    t.boolean "active", default: true
  end

  create_table "nominations", force: :cascade do |t|
    t.date "date"
    t.integer "user_id"
    t.index ["user_id"], name: "index_nominations_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "category"
    t.string "question"
    t.string "answer"
    t.string "money"
    t.string "date"
    t.integer "episode"
    t.boolean "active", default: true
  end

  create_table "scoreboards", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "scores", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spins", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "score"
    t.integer "team_id"
    t.integer "score_multiplier", default: 1
    t.boolean "phone_a_friend", default: false
    t.boolean "ask_the_team", default: false
    t.boolean "fifty_fifty", default: false
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["team_id"], name: "index_users_on_team_id"
  end

end
