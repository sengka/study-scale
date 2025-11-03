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

ActiveRecord::Schema[8.0].define(version: 2025_11_03_073729) do
  create_table "items", force: :cascade do |t|
    t.integer "scale_id", null: false
    t.string "text"
    t.integer "min"
    t.integer "max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scale_id"], name: "index_items_on_scale_id"
  end

  create_table "response_items", force: :cascade do |t|
    t.integer "response_id", null: false
    t.integer "item_id", null: false
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_response_items_on_item_id"
    t.index ["response_id"], name: "index_response_items_on_response_id"
  end

  create_table "responses", force: :cascade do |t|
    t.integer "survey_id", null: false
    t.string "participant_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_responses_on_survey_id"
  end

  create_table "scales", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.integer "scale_id", null: false
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scale_id"], name: "index_surveys_on_scale_id"
  end

  add_foreign_key "items", "scales"
  add_foreign_key "response_items", "items"
  add_foreign_key "response_items", "responses"
  add_foreign_key "responses", "surveys"
  add_foreign_key "surveys", "scales"
end
