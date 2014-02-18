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

ActiveRecord::Schema.define(version: 20140218031437) do

  create_table "artists", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "contact_city"
    t.string   "contact_state"
    t.string   "contact_postal"
    t.string   "contact_address_one"
    t.string   "contact_address_two"
    t.string   "phone"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "modified_at"
    t.string   "access_token"
  end

  create_table "submissions", force: true do |t|
    t.string  "slide"
    t.integer "artist_id"
    t.string  "title"
    t.integer "year"
    t.string  "medium"
    t.integer "price"
  end

  add_index "submissions", ["artist_id"], name: "index_submissions_on_artist_id"

end
