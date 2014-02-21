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

ActiveRecord::Schema.define(version: 20140221052518) do

  create_table "applications", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "artist_id"
    t.integer  "exhibition_id"
  end

  add_index "applications", ["artist_id"], name: "index_applications_on_artist_id"
  add_index "applications", ["exhibition_id"], name: "index_applications_on_exhibition_id"

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
    t.integer  "exhibition_id"
  end

  create_table "artists_tables", force: true do |t|
    t.string "artists"
  end

  create_table "exhibitions", force: true do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "name"
    t.datetime "submission_start"
    t.datetime "submission_end"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "application_contract"
  end

  create_table "installations", force: true do |t|
    t.integer  "exhibition_id"
    t.integer  "artist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "submissions", force: true do |t|
    t.string  "slide"
    t.integer "artist_id"
    t.string  "title"
    t.integer "year"
    t.string  "medium"
    t.integer "price"
    t.integer "exhibition_id"
    t.integer "installation_id"
    t.integer "application_id"
  end

  add_index "submissions", ["application_id"], name: "index_submissions_on_application_id"
  add_index "submissions", ["artist_id"], name: "index_submissions_on_artist_id"
  add_index "submissions", ["installation_id"], name: "index_submissions_on_installation_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.boolean  "admin"
    t.boolean  "superuser"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_hash"
    t.string   "password_salt"
  end

end
