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

ActiveRecord::Schema.define(version: 20151108215815) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercises", force: :cascade do |t|
    t.string   "name"
    t.integer  "workout_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "follows", force: :cascade do |t|
    t.integer  "followable_id",                   null: false
    t.string   "followable_type",                 null: false
    t.integer  "follower_id",                     null: false
    t.string   "follower_type",                   null: false
    t.boolean  "blocked",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables", using: :btree
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows", using: :btree

  create_table "refile_attachments", force: :cascade do |t|
    t.string "namespace", null: false
  end

  add_index "refile_attachments", ["namespace"], name: "index_refile_attachments_on_namespace", using: :btree

  create_table "schedules", force: :cascade do |t|
    t.integer  "schedulable_id"
    t.string   "schedulable_type"
    t.date     "date"
    t.time     "time"
    t.string   "rule"
    t.string   "interval"
    t.text     "day"
    t.text     "day_of_week"
    t.datetime "until"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "profile_image_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "workout_items", force: :cascade do |t|
    t.integer  "workout_id"
    t.integer  "exercise_id"
    t.integer  "sets"
    t.integer  "reps"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "complete",    default: false, null: false
  end

  create_table "workout_occurrences", force: :cascade do |t|
    t.integer  "schedulable_id"
    t.string   "schedulable_type"
    t.datetime "date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "workout_occurrences", ["schedulable_type", "schedulable_id"], name: "index_workout_occurrences_on_schedulable_type_schedulable_id", using: :btree

  create_table "workout_types", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workouts", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.datetime "date"
    t.time     "time"
    t.boolean  "began",      default: false, null: false
    t.boolean  "completed",  default: false, null: false
  end

end
