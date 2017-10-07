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

ActiveRecord::Schema.define(version: 20171006223547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airlines", force: :cascade do |t|
    t.integer  "airline_id"
    t.string   "name"
    t.string   "alias"
    t.string   "iata"
    t.string   "icao"
    t.string   "callsign"
    t.string   "country"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "airports", force: :cascade do |t|
    t.integer  "airport_id"
    t.string   "name"
    t.string   "city"
    t.string   "country"
    t.string   "iata"
    t.string   "icao"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "altitude"
    t.string   "timezone"
    t.string   "dst"
    t.string   "tz_db_timezone"
    t.string   "ap_type"
    t.string   "source"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "routes", force: :cascade do |t|
    t.string   "airline"
    t.integer  "airline_id"
    t.string   "source_airport"
    t.integer  "source_airport_id"
    t.string   "destination_airport"
    t.integer  "destination_airport_id"
    t.string   "codeshare"
    t.string   "stops"
    t.string   "equipment"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
