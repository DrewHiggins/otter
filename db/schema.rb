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

ActiveRecord::Schema.define(version: 20160730154007) do

  create_table "branches", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brothers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "family_id"
    t.integer  "branch_id"
    t.integer  "rush_class_id"
    t.string   "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "ancestry"
  end

  add_index "brothers", ["branch_id"], name: "index_brothers_on_branch_id"
  add_index "brothers", ["family_id"], name: "index_brothers_on_family_id"
  add_index "brothers", ["rush_class_id"], name: "index_brothers_on_rush_class_id"

  create_table "families", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rush_classes", force: :cascade do |t|
    t.string   "greek_name"
    t.integer  "year"
    t.boolean  "semester"
    t.date     "initiation_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
