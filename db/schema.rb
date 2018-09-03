# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_09_03_093313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.bigint "design_id"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["design_id"], name: "index_attachments_on_design_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contributions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "request_id"
    t.integer "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_contributions_on_request_id"
    t.index ["user_id"], name: "index_contributions_on_user_id"
  end

  create_table "designers", force: :cascade do |t|
    t.text "description"
    t.text "experience"
    t.string "website"
    t.string "thingiverse_username"
    t.string "linkdin"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_designers_on_user_id"
  end

  create_table "designs", force: :cascade do |t|
    t.text "description"
    t.string "name"
    t.integer "likes", default: 0
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_designs_on_category_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "state", default: 0
    t.string "token_sku", null: false
    t.integer "amount_cents", default: 0, null: false
    t.jsonb "payment"
    t.bigint "wallet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wallet_id"], name: "index_orders_on_wallet_id"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "request_id"
    t.bigint "user_id"
    t.integer "status", default: 0, null: false
    t.integer "accepted_price", null: false
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_projects_on_request_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "design_id"
    t.integer "kind", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["design_id"], name: "index_requests_on_design_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "tokens", force: :cascade do |t|
    t.string "sku"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
  end

  create_table "users", force: :cascade do |t|
    t.boolean "admin", default: false
    t.boolean "is_designer", default: false
    t.string "username", default: "", null: false
    t.string "printer"
    t.string "first_name"
    t.string "last_name"
    t.string "photo"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wallets", force: :cascade do |t|
    t.integer "tokens", default: 200
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  add_foreign_key "attachments", "designs"
  add_foreign_key "contributions", "requests"
  add_foreign_key "contributions", "users"
  add_foreign_key "designers", "users"
  add_foreign_key "designs", "categories"
  add_foreign_key "orders", "wallets"
  add_foreign_key "projects", "requests"
  add_foreign_key "projects", "users"
  add_foreign_key "requests", "designs"
  add_foreign_key "requests", "users"
  add_foreign_key "wallets", "users"
end
