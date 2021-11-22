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

ActiveRecord::Schema.define(version: 2021_11_22_023015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.string "account_code", limit: 32
    t.string "mail_address", limit: 129, null: false
    t.string "password_digest", null: false
    t.string "family_name", limit: 16, null: false
    t.string "first_name", limit: 16, null: false
    t.string "kana_family_name", limit: 16
    t.string "kana_first_name", limit: 16
    t.date "birth"
    t.date "valid_start_date"
    t.date "valid_end_date"
    t.boolean "is_valid", null: false
    t.text "memo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "control_devices", force: :cascade do |t|
    t.bigint "control_device_id", null: false
    t.string "name", limit: 30, null: false
    t.string "physical_code", limit: 32, null: false
    t.boolean "is_gateway", null: false
    t.string "schema_id", limit: 6
    t.text "memo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "operation_histories", force: :cascade do |t|
    t.bigint "grp_id", null: false
    t.bigint "handle_id", null: false
    t.datetime "operation_datetime", null: false
    t.integer "message_id", null: false
    t.text "operation_detail", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
