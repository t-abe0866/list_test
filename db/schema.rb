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

ActiveRecord::Schema.define(version: 2021_11_08_054402) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.bigint "account_id"
    t.string "account_code", limit: 32
    t.string "mail_address", limit: 129
    t.string "password", limit: 60
    t.string "family_name", limit: 16
    t.string "first_name", limit: 16
    t.string "kana_family_name", limit: 16
    t.string "kana_first_name", limit: 16
    t.string "birth_year", limit: 4
    t.string "birth_month", limit: 4
    t.string "birth_day", limit: 4
    t.date "valid_start_date"
    t.date "valid_end_date"
    t.boolean "is_valid"
    t.text "memo"
    t.date "created_date"
    t.date "last_updated"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
