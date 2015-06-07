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

ActiveRecord::Schema.define(version: 20150607011048) do

  create_table "reactions", force: true do |t|
    t.integer  "user_id"
    t.integer  "show_id"
    t.string   "reaction_type"
    t.string   "reaction"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shows", force: true do |t|
    t.string   "rovi_id"
    t.string   "title"
    t.string   "description"
    t.string   "genre"
    t.string   "img_link"
    t.string   "trailer_link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "duration"
    t.integer  "rating"
  end

  create_table "swipes", force: true do |t|
    t.integer  "user_id"
    t.integer  "show_id"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "fb_uid"
    t.string   "fb_token"
    t.string   "fb_profile_picture"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
