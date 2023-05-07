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

ActiveRecord::Schema[7.0].define(version: 2023_05_07_160632) do
  create_table "card_pacients", force: :cascade do |t|
    t.integer "clinic_id"
    t.integer "pacient_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_id"], name: "index_card_pacients_on_clinic_id"
    t.index ["pacient_id"], name: "index_card_pacients_on_pacient_id"
  end

  create_table "clinics", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doctors", force: :cascade do |t|
    t.string "name"
    t.string "stag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "otdelenies", force: :cascade do |t|
    t.integer "clinic_id"
    t.integer "doctor_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_id"], name: "index_otdelenies_on_clinic_id"
    t.index ["doctor_id"], name: "index_otdelenies_on_doctor_id"
  end

  create_table "pacients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specials", force: :cascade do |t|
    t.integer "doctor_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_specials_on_doctor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "card_pacients", "clinics"
  add_foreign_key "card_pacients", "pacients"
  add_foreign_key "specials", "doctors"
end
