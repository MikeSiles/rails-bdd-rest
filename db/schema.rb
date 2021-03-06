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

ActiveRecord::Schema.define(version: 2018_06_21_152716) do

  create_table "addresses", force: :cascade do |t|
    t.string "name"
    t.string "line_1"
    t.string "line_2"
    t.string "city"
    t.integer "state_id"
    t.integer "county_id"
    t.integer "zip_id"
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_addresses_on_country_id"
    t.index ["county_id"], name: "index_addresses_on_county_id"
    t.index ["state_id"], name: "index_addresses_on_state_id"
    t.index ["zip_id"], name: "index_addresses_on_zip_id"
  end

  create_table "addresses_customers", id: false, force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "address_id", null: false
    t.index ["address_id", "customer_id"], name: "index_addresses_customers_on_address_id_and_customer_id"
    t.index ["customer_id", "address_id"], name: "index_addresses_customers_on_customer_id_and_address_id"
  end

  create_table "addresses_people", id: false, force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "address_id", null: false
    t.index ["address_id", "person_id"], name: "index_addresses_people_on_address_id_and_person_id"
    t.index ["person_id", "address_id"], name: "index_addresses_people_on_person_id_and_address_id"
  end

  create_table "counties", force: :cascade do |t|
    t.string "name"
    t.integer "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_counties_on_state_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.integer "salesperson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["salesperson_id"], name: "index_customers_on_salesperson_id"
  end

  create_table "customers_emails", id: false, force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "email_id", null: false
    t.index ["customer_id", "email_id"], name: "index_customers_emails_on_customer_id_and_email_id"
    t.index ["email_id", "customer_id"], name: "index_customers_emails_on_email_id_and_customer_id"
  end

  create_table "customers_people", id: false, force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "person_id", null: false
    t.index ["customer_id", "person_id"], name: "index_customers_people_on_customer_id_and_person_id"
    t.index ["person_id", "customer_id"], name: "index_customers_people_on_person_id_and_customer_id"
  end

  create_table "customers_phones", id: false, force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "phone_id", null: false
    t.index ["customer_id", "phone_id"], name: "index_customers_phones_on_customer_id_and_phone_id"
    t.index ["phone_id", "customer_id"], name: "index_customers_phones_on_phone_id_and_customer_id"
  end

  create_table "emails", force: :cascade do |t|
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emails_people", id: false, force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "email_id", null: false
    t.index ["email_id", "person_id"], name: "index_emails_people_on_email_id_and_person_id"
    t.index ["person_id", "email_id"], name: "index_emails_people_on_person_id_and_email_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "addresses"
    t.string "phones"
    t.string "emails"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people_phones", id: false, force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "phone_id", null: false
    t.index ["person_id", "phone_id"], name: "index_people_phones_on_person_id_and_phone_id"
    t.index ["phone_id", "person_id"], name: "index_people_phones_on_phone_id_and_person_id"
  end

  create_table "phones", force: :cascade do |t|
    t.string "number"
    t.string "extension"
    t.string "line_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salespeople", force: :cascade do |t|
    t.string "customers"
    t.integer "user_id"
    t.integer "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_salespeople_on_person_id"
    t.index ["user_id"], name: "index_salespeople_on_user_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "postal_code"
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "zips", force: :cascade do |t|
    t.string "code"
    t.integer "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_zips_on_state_id"
  end

end
