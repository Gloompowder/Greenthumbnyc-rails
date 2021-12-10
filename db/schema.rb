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

ActiveRecord::Schema.define(version: 2021_12_03_063212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gardens", force: :cascade do |t|
    t.string "name"
    t.integer "assemblydist"
    t.string "borough"
    t.integer "communityboard"
    t.integer "congressionaldist"
    t.integer "coundist"
    t.string "juris"
    t.string "parksid"
    t.string "policeprecinct"
    t.string "status"
    t.integer "statesenatedist"
    t.integer "zipcode"
    t.string "openhrssa"
    t.string "openhrssu"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "picture"
    t.string "streetnum"
    t.string "apt"
    t.string "city"
    t.string "state"
    t.string "country"
    t.integer "zipcode"
    t.datetime "birthday"
    t.string "gender"
    t.string "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.string "firstname"
    t.string "lastname"
  end

  create_table "visits", force: :cascade do |t|
    t.integer "user_id"
    t.integer "garden_id"
    t.datetime "scheduledin"
    t.datetime "scheduledout"
    t.datetime "checkin"
    t.datetime "checkout"
    t.text "review"
    t.integer "rating"
    t.boolean "visiting"
    t.boolean "visited"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
