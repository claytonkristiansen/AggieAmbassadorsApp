# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_11_15_014049) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendance_records", force: :cascade do |t|
    t.integer "member_id"
    t.integer "event_id"
    t.boolean "confirmed_attending"
    t.datetime "time_confirmed"
    t.string "confirmation_link"
    t.boolean "attended"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.date "event_date"
    t.time "event_time"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "type"
    t.string "instructions"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "email", null: false
    t.string "full_name"
    t.string "uid"
    t.string "avatar_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "position_title"
    t.integer "privilege_level"
    t.string "preferred_name"
    t.boolean "send_emails"
    t.index ["email"], name: "index_members_on_email", unique: true
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "contact_name"
    t.string "contact_email"
    t.string "contact_phone"
    t.string "contact_title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "auth_id"
    t.string "position_title"
    t.boolean "priviledged"
    t.string "preferred_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
