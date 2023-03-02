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

ActiveRecord::Schema[7.0].define(version: 2023_02_20_061557) do
  create_table "accodamations", force: :cascade do |t|
    t.string "room_type"
    t.integer "room_number"
    t.integer "hotel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "parking_type"
    t.string "food_acc"
    t.string "offer"
    t.index ["hotel_id"], name: "index_accodamations_on_hotel_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "custmer_id", null: false
    t.integer "accodamation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accodamation_id"], name: "index_bookings_on_accodamation_id"
    t.index ["custmer_id"], name: "index_bookings_on_custmer_id"
  end

  create_table "custmers", force: :cascade do |t|
    t.string "name"
    t.string "email_id"
    t.integer "phone_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.text "token"
    t.datetime "expire_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "accodamations", "hotels"
  add_foreign_key "bookings", "accodamations"
  add_foreign_key "bookings", "custmers"
end
