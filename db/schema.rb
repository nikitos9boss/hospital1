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

ActiveRecord::Schema[7.0].define(version: 2023_03_26_140855) do
  create_table "card_pacients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clinics", force: :cascade do |t|
    t.integer "otdelenie_id"
    t.integer "cardPacient_id"
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cardPacient_id"], name: "index_clinics_on_cardPacient_id"
    t.index ["otdelenie_id"], name: "index_clinics_on_otdelenie_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.integer "otdelenie_id"
    t.integer "special_id"
    t.string "name"
    t.string "stag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["otdelenie_id"], name: "index_doctors_on_otdelenie_id"
    t.index ["special_id"], name: "index_doctors_on_special_id"
  end

  create_table "otdelenies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pacients", force: :cascade do |t|
    t.integer "cardPacient_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cardPacient_id"], name: "index_pacients_on_cardPacient_id"
  end

  create_table "specials", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
