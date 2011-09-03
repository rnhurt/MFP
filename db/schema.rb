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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110328020049) do

  create_table "addresses", :force => true do |t|
    t.string   "street_number"
    t.string   "street_number_suffix"
    t.string   "street_name"
    t.string   "street_type"
    t.integer  "street_direction_id"
    t.integer  "address_type_id"
    t.string   "block"
    t.string   "city"
    t.string   "postal_code"
    t.integer  "region_id"
    t.integer  "country_id"
    t.string   "crossstreet"
    t.decimal  "latitude",             :precision => 9, :scale => 6
    t.decimal  "longitude",            :precision => 9, :scale => 6
    t.boolean  "active",                                             :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "codes", :force => true do |t|
    t.string   "type"
    t.integer  "parent_id"
    t.string   "code"
    t.string   "value"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_types", :force => true do |t|
    t.string   "name"
    t.boolean  "active",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.integer  "contact_type_id"
    t.datetime "incident_timestamp"
    t.string   "ol_number"
    t.integer  "ol_state_id"
    t.string   "title"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "suffix"
    t.string   "ssn"
    t.date     "dob"
    t.integer  "race_id"
    t.integer  "gender_id"
    t.integer  "height"
    t.integer  "weight"
    t.integer  "eye_color_id"
    t.integer  "hair_color_id"
    t.boolean  "active",             :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.integer "contact_id"
    t.integer "address_id"
    t.integer "role_id"
    t.string  "phone_number"
    t.string  "email_address"
    t.boolean "active"
  end

  create_table "reports", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "static_data", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.boolean  "active",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
