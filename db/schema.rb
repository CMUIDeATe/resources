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

ActiveRecord::Schema.define(version: 20160325073840) do

  create_table "task_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "label",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "task_locations", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "label",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "task_notes", force: :cascade do |t|
    t.integer  "task_id",    limit: 4
    t.string   "notes",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "task_notes", ["task_id"], name: "index_task_notes_on_task_id", using: :btree

  create_table "task_states", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "label",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "task_templates", force: :cascade do |t|
    t.string   "description",      limit: 255
    t.integer  "task_location_id", limit: 4
    t.integer  "task_category_id", limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "task_templates", ["task_category_id"], name: "index_task_templates_on_task_category_id", using: :btree
  add_index "task_templates", ["task_location_id"], name: "index_task_templates_on_task_location_id", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.integer  "task_template_id", limit: 4
    t.integer  "task_state_id",    limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "tasks", ["task_state_id"], name: "index_tasks_on_task_state_id", using: :btree
  add_index "tasks", ["task_template_id"], name: "index_tasks_on_task_template_id", using: :btree

  add_foreign_key "task_notes", "tasks"
  add_foreign_key "task_templates", "task_categories"
  add_foreign_key "task_templates", "task_locations"
  add_foreign_key "tasks", "task_states"
  add_foreign_key "tasks", "task_templates"
end
