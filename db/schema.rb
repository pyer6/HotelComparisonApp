# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_13_034647) do

  create_table "hotels", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name", default: "", null: false
    t.text "information_url"
    t.text "plan_list_url"
    t.integer "review_count"
    t.float "review_average"
    t.text "review_url"
    t.string "postal_code"
    t.string "address1"
    t.string "address2"
    t.string "telephone_no"
    t.string "parking_information"
    t.string "access"
    t.text "hotel_image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "hotel_no", null: false
    t.integer "hotel_min_charge"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_hotels_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "hotels", "users"
end
