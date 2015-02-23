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

ActiveRecord::Schema.define(version: 20150223175149) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "act_jobs", force: :cascade do |t|
    t.integer  "act_id"
    t.integer  "line_id"
    t.float    "square",     default: 0.0
    t.integer  "machine"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "act_jobs", ["act_id"], name: "index_act_jobs_on_act_id", using: :btree
  add_index "act_jobs", ["line_id"], name: "index_act_jobs_on_line_id", using: :btree

  create_table "acts", force: :cascade do |t|
    t.integer  "date_act_id"
    t.integer  "number_act"
    t.float    "money",       default: 0.0
    t.integer  "street_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "acts", ["date_act_id"], name: "index_acts_on_date_act_id", using: :btree
  add_index "acts", ["street_id"], name: "index_acts_on_street_id", using: :btree

  create_table "date_acts", force: :cascade do |t|
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "date_jobs", force: :cascade do |t|
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer  "date_job_id"
    t.integer  "line_id"
    t.float    "square",      default: 0.0
    t.integer  "street_id"
    t.string   "house"
    t.string   "note"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "jobs", ["date_job_id"], name: "index_jobs_on_date_job_id", using: :btree
  add_index "jobs", ["line_id"], name: "index_jobs_on_line_id", using: :btree
  add_index "jobs", ["street_id"], name: "index_jobs_on_street_id", using: :btree

  create_table "lines", force: :cascade do |t|
    t.string   "name"
    t.string   "view"
    t.text     "describe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "streets", force: :cascade do |t|
    t.string   "street"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "act_jobs", "acts"
  add_foreign_key "act_jobs", "lines"
  add_foreign_key "acts", "date_acts"
  add_foreign_key "acts", "streets"
  add_foreign_key "jobs", "date_jobs"
  add_foreign_key "jobs", "lines"
  add_foreign_key "jobs", "streets"
end
