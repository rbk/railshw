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

ActiveRecord::Schema.define(version: 20140220223259) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "parent_category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.string   "title"
    t.string   "number"
    t.integer  "credits"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses_tutorials", force: true do |t|
    t.integer "course_id"
    t.integer "tutorial_id"
  end

  create_table "sections", force: true do |t|
    t.string   "days"
    t.string   "times"
    t.integer  "course_id"
    t.integer  "semester_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.string   "type"
  end

  add_index "sections", ["course_id"], name: "index_sections_on_course_id"
  add_index "sections", ["semester_id"], name: "index_sections_on_semester_id"

  create_table "semesters", force: true do |t|
    t.string   "season"
    t.string   "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "steps", force: true do |t|
    t.integer  "position"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tutorial_id"
  end

  create_table "tutorials", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
