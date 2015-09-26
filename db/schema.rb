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

ActiveRecord::Schema.define(version: 20150721083745) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apikey", id: false, force: :cascade do |t|
    t.integer  "user_id"
    t.string   "api_key",        limit: 40
    t.datetime "time_to_expire"
  end

  create_table "block", primary_key: "block_id", force: :cascade do |t|
    t.integer "subject_id"
    t.integer "grade_id"
    t.integer "board_id"
    t.integer "block_number"
    t.text    "block_desc"
    t.integer "block_icon"
  end

  create_table "bs_lookup", id: false, force: :cascade do |t|
    t.integer "keyword_id"
    t.integer "type"
    t.string  "bs_keyword",  limit: 50
    t.integer "_order"
    t.text    "tip_p"
    t.text    "tip_n"
    t.text    "bs_question"
  end

  create_table "bs_map", primary_key: "bs_map_id", force: :cascade do |t|
    t.integer "keyword_id"
    t.integer "metric_id"
    t.integer "metric_value"
  end

  create_table "bs_metric", primary_key: "metric_id", force: :cascade do |t|
    t.string  "metric_name",     limit: 300
    t.string  "metric_question", limit: 300
    t.text    "description"
    t.text    "tip_c"
    t.text    "tip_s"
    t.integer "metric_type",     limit: 2
  end

  create_table "bs_score_map", id: false, force: :cascade do |t|
    t.integer "u_bs_sl_id"
    t.integer "bs_keyword_id"
    t.integer "metric_id"
    t.integer "time_on_screen"
  end

  create_table "bs_scoring_lookup", primary_key: "u_bs_sl_id", force: :cascade do |t|
    t.integer "user_id"
    t.date    "date_time"
    t.integer "lp_id"
    t.integer "course_id"
    t.integer "user_id_accessor"
    t.string  "bs_sl_id",         limit: 30
    t.integer "synced"
  end

  create_table "bs_type", id: false, force: :cascade do |t|
    t.integer "type_id"
    t.string  "type_name", limit: 50
  end

  create_table "cars", force: :cascade do |t|
    t.string  "name",  limit: 20
    t.integer "price"
  end

  create_table "class", primary_key: "class_id", force: :cascade do |t|
    t.string "class_name", limit: 100
  end

  create_table "course", primary_key: "course_id", force: :cascade do |t|
    t.string  "course_name", limit: 100
    t.integer "school_id"
    t.integer "class_id"
    t.integer "section_id"
    t.integer "term_id"
    t.integer "subject_id"
  end

  create_table "empdata", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "five", primary_key: "five_id", force: :cascade do |t|
    t.string "five_name", limit: 20
  end

  create_table "fivealookup", id: false, force: :cascade do |t|
    t.integer "five_lookup_id"
    t.integer "lp_id"
    t.text    "description"
  end

  create_table "key_word", primary_key: "keyword_id", force: :cascade do |t|
    t.string "step", limit: 30
  end

  create_table "lessonplan", primary_key: "lp_id", force: :cascade do |t|
    t.integer "block_id"
    t.integer "lp_number"
    t.string  "lp_name",   limit: 50
    t.text    "lp_desc"
    t.integer "lp_icon"
  end

  create_table "role", primary_key: "role_id", force: :cascade do |t|
    t.string "role_name", limit: 100
    t.text   "role_desc"
  end

  create_table "school", primary_key: "school_id", force: :cascade do |t|
    t.string "school_name", limit: 100
  end

  create_table "section", primary_key: "section_id", force: :cascade do |t|
    t.string "section_name", limit: 100
  end

  create_table "students", id: false, force: :cascade do |t|
    t.integer  "roll_no",    null: false
    t.string   "s_name"
    t.integer  "marks"
    t.integer  "Teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subject", primary_key: "subject_id", force: :cascade do |t|
    t.string "subject_name", limit: 100
  end

  create_table "teacher_course_lookup", id: false, force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "user_id",   null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "subject"
    t.decimal  "phone"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "term", primary_key: "term_id", force: :cascade do |t|
    t.date "term_start"
    t.date "term_end"
  end

  create_table "user_table", primary_key: "user_id", force: :cascade do |t|
    t.string  "username",   limit: 30
    t.integer "role_id"
    t.string  "first_name", limit: 30
    t.string  "last_name",  limit: 30
    t.string  "email",      limit: 50
    t.integer "phone"
    t.string  "hash",       limit: 100
    t.string  "salt",       limit: 100
    t.integer "deleted"
    t.integer "blocked"
  end

  add_foreign_key "fivealookup", "five", column: "five_lookup_id", primary_key: "five_id", name: "fivealookup_five_lookup_id_fkey"
  add_foreign_key "fivealookup", "lessonplan", column: "lp_id", primary_key: "lp_id", name: "fivealookup_lp_id_fkey"
end
