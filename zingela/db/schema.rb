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

ActiveRecord::Schema.define(version: 20151121105141) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  limit: 255
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "password",               limit: 255
    t.string   "name",                   limit: 255
    t.string   "surname",                limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "communities", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "desctiption", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "project_id",  limit: 4
  end

  create_table "companies", force: :cascade do |t|
    t.string   "email",                  limit: 255
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.integer  "admin_id",               limit: 4
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "password",               limit: 255
    t.string   "company_name",           limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "companies", ["email"], name: "index_companies_on_email", unique: true, using: :btree
  add_index "companies", ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true, using: :btree

  create_table "crown_diameters", force: :cascade do |t|
    t.integer  "observation_id",       limit: 4
    t.string   "lower_crown_diameter", limit: 255
    t.string   "upper_crown_diameter", limit: 255
    t.float    "transect_length",      limit: 24
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "field_data", force: :cascade do |t|
    t.date     "date"
    t.integer  "location_id",         limit: 4
    t.integer  "latitude_degree",     limit: 4
    t.integer  "latitude_minutes",    limit: 4
    t.float    "latitude_seconds",    limit: 24
    t.integer  "longitude_degree",    limit: 4
    t.integer  "longitude_minutes",   limit: 4
    t.float    "longitude_seconds",   limit: 24
    t.string   "habitat_description", limit: 255
    t.integer  "project_id",          limit: 4
    t.integer  "user_id",             limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "growth_forms", force: :cascade do |t|
    t.integer  "observation_id", limit: 4
    t.string   "description",    limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "country",    limit: 255
    t.string   "province",   limit: 255
    t.string   "city",       limit: 255
    t.string   "address_1",  limit: 255
    t.string   "address_2",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",    limit: 4
    t.integer  "company_id", limit: 4
  end

  create_table "manages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "observations", force: :cascade do |t|
    t.string   "notes",          limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "field_datum_id", limit: 4
  end

  create_table "plant_covers", force: :cascade do |t|
    t.float    "percentage",        limit: 24
    t.float    "lower_class_limit", limit: 24
    t.float    "upper_class_limit", limit: 24
    t.float    "class_interval",    limit: 24
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.date     "start_date"
    t.date     "expected_delivery_date"
    t.date     "actual_delivery_date"
    t.boolean  "active"
    t.date     "date_changed"
    t.integer  "user_id",                limit: 4
    t.integer  "company_id",             limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "species", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "potential_biomass", limit: 255
    t.string   "species",           limit: 255
    t.string   "threat_status",     limit: 255
    t.string   "sa_endemic",        limit: 255
    t.string   "sysnonym_of",       limit: 255
    t.string   "common_name",       limit: 255
    t.string   "life_cycle",        limit: 255
    t.string   "growth_forms",      limit: 255
    t.string   "min_hieght",        limit: 255
    t.string   "max_height",        limit: 255
    t.string   "min_altitude",      limit: 255
    t.string   "max_altitude",      limit: 255
    t.string   "distribution",      limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "species_family_id", limit: 4
  end

  create_table "species_families", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "company_id", limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.integer  "company_id",             limit: 4
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "password",               limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "welcomes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
