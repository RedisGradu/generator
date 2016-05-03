# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160429233121) do

  create_table "customers", force: :cascade do |t|
    t.integer  "identity_id",   limit: 4
    t.date     "register_date"
    t.boolean  "status"
    t.date     "closing_date"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "debts", force: :cascade do |t|
    t.integer  "customer_id", limit: 4
    t.integer  "payment_id",  limit: 4
    t.date     "billed_date"
    t.decimal  "cost",                  precision: 5, scale: 2
    t.decimal  "taxes",                 precision: 5, scale: 2
    t.boolean  "status"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "debts", ["customer_id"], name: "index_debts_on_customer_id", using: :btree

  create_table "firsts", force: :cascade do |t|
    t.text "firstname", limit: 65535, null: false
  end

  add_index "firsts", ["firstname"], name: "firstname", type: :fulltext

  create_table "identities", force: :cascade do |t|
    t.integer  "customer_id",    limit: 4
    t.integer  "citizen_no",     limit: 8
    t.string   "full_name",      limit: 255
    t.date     "birthdate"
    t.string   "place_of_birth", limit: 255
    t.string   "mother_name",    limit: 255
    t.string   "father_name",    limit: 255
    t.integer  "district",       limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "lasts", force: :cascade do |t|
    t.text "lastname", limit: 65535, null: false
  end

  add_index "lasts", ["lastname"], name: "lastname", type: :fulltext

  create_table "payments", force: :cascade do |t|
    t.integer  "customer_id",  limit: 4
    t.integer  "debt_id",      limit: 4
    t.date     "payment_date"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "payments", ["customer_id"], name: "index_payments_on_customer_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.string   "password",   limit: 255
    t.string   "full_name",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "debts", "customers"
  add_foreign_key "payments", "customers"
end
