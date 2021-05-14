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

ActiveRecord::Schema.define(version: 2021_05_10_175228) do

  create_table "coins", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.string "symbol", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["symbol"], name: "index_coins_on_symbol", unique: true
  end

  create_table "dashboards", force: :cascade do |t|
    t.integer "user_id"
    t.string "name", null: false
    t.boolean "default", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_dashboards_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "from_coin_id", null: false
    t.integer "to_coin_id", null: false
    t.integer "dashboard_id"
    t.decimal "from_amount", precision: 30, scale: 10, null: false
    t.decimal "to_amount", precision: 30, scale: 10, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dashboard_id"], name: "index_transactions_on_dashboard_id"
    t.index ["from_coin_id"], name: "index_transactions_on_from_coin_id"
    t.index ["to_coin_id"], name: "index_transactions_on_to_coin_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "default_coin_id"
    t.index ["default_coin_id"], name: "index_users_on_default_coin_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "transactions", "coins", column: "from_coin_id"
  add_foreign_key "transactions", "coins", column: "to_coin_id"
  add_foreign_key "users", "coins", column: "default_coin_id"
end
