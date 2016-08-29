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

ActiveRecord::Schema.define(version: 20151130142900) do

  create_table "alternatives", force: :cascade do |t|
    t.integer  "question_id"
    t.string   "letter"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "alternatives", ["question_id"], name: "index_alternatives_on_question_id"

  create_table "battles", force: :cascade do |t|
    t.text     "player_1_answers"
    t.text     "player_2_answers"
    t.string   "category"
    t.integer  "player_1_time"
    t.integer  "player_2_time"
    t.boolean  "player_1_start",   default: false
    t.boolean  "player_2_start",   default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "player_1_id"
    t.integer  "player_2_id"
    t.integer  "winner_id"
    t.boolean  "processed",        default: false
  end

  add_index "battles", ["player_1_id"], name: "index_battles_on_player_1_id"
  add_index "battles", ["player_2_id"], name: "index_battles_on_player_2_id"
  add_index "battles", ["winner_id"], name: "index_battles_on_winner_id"

  create_table "battles_questions", force: :cascade do |t|
    t.integer "battle_id"
    t.integer "question_id"
  end

  create_table "candidates", force: :cascade do |t|
    t.decimal  "general_average"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "post_id"
    t.integer  "user_id"
    t.text     "user_ratings"
  end

  create_table "exams", force: :cascade do |t|
    t.text    "questions"
    t.text    "right_answers"
    t.text    "user_answers"
    t.integer "accepted_answers", default: 0
  end

  create_table "medals", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.text     "achieved_instructions"
    t.text     "message_instructions"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "medals_users", force: :cascade do |t|
    t.integer "medal_id"
    t.integer "user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "battle_id"
    t.integer  "user_id"
    t.boolean  "visualized"
    t.string   "link"
    t.string   "sender"
  end

  add_index "notifications", ["battle_id"], name: "index_notifications_on_battle_id"
  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id"

  create_table "posts", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "topic_id"
    t.integer  "user_id"
    t.text     "user_ratings"
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "year"
    t.string   "area"
    t.integer  "number"
    t.string   "enunciation"
    t.string   "reference"
    t.string   "image",        default: ""
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "right_answer"
    t.integer  "tries",        default: 0
    t.integer  "hits",         default: 0
    t.integer  "users_hits",   default: 0
    t.integer  "users_tries",  default: 0
  end

  add_index "questions", ["number"], name: "index_questions_on_number"
  add_index "questions", ["year"], name: "index_questions_on_year"

  create_table "texts", force: :cascade do |t|
    t.string   "title"
    t.text     "paragraphs"
    t.string   "reference"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string   "name"
    t.integer  "question_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "nickname"
    t.string   "name"
    t.string   "email"
    t.integer  "level",                      default: 0
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "password_digest"
    t.integer  "points",                     default: 0
    t.text     "accepted_questions"
    t.boolean  "role_admin",                 default: false
    t.text     "answered_exams"
    t.integer  "battle_points",              default: 0
    t.integer  "wins",                       default: 0
    t.text     "exam_performance"
    t.integer  "exams_total_questions",      default: 0
    t.text     "tried_questions"
    t.string   "profile_image_file_name",    default: ""
    t.string   "profile_image_content_type"
    t.integer  "profile_image_file_size"
    t.datetime "profile_image_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
