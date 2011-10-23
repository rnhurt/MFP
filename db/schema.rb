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

ActiveRecord::Schema.define(:version => 20111023214514) do

  create_table "addresses", :force => true do |t|
    t.string   "street_number"
    t.string   "street_number_suffix"
    t.string   "street_name"
    t.string   "street_type"
    t.integer  "street_direction_id"
    t.integer  "address_type_id"
    t.string   "block"
    t.string   "crossstreet"
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "county_id"
    t.integer  "city_id"
    t.string   "postal_code"
    t.decimal  "latitude",             :precision => 9, :scale => 6
    t.decimal  "longitude",            :precision => 9, :scale => 6
    t.boolean  "active",                                             :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aliases", :force => true do |t|
    t.integer  "contact_id"
    t.string   "name"
    t.boolean  "active",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "calls_for_service", :force => true do |t|
    t.boolean  "active",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", :force => true do |t|
    t.string   "code"
    t.string   "local_code"
    t.integer  "county_id"
    t.string   "name"
    t.boolean  "active",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "codes", :force => true do |t|
    t.string   "type"
    t.integer  "parent_id"
    t.integer  "state_id"
    t.string   "code"
    t.string   "value"
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

  create_table "counties", :force => true do |t|
    t.string   "code"
    t.string   "local_code"
    t.integer  "state_id"
    t.string   "name"
    t.boolean  "active",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string   "code"
    t.string   "local_code"
    t.string   "abbreviation"
    t.string   "name"
    t.boolean  "active",       :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "involvements", :force => true do |t|
    t.integer  "report_id"
    t.integer  "contact_id"
    t.integer  "role_id"
    t.boolean  "active",     :default => true
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

  create_table "relationships", :force => true do |t|
    t.integer  "relationship_type_id"
    t.integer  "contact_id"
    t.integer  "contact_id_target"
    t.boolean  "active",               :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", :force => true do |t|
    t.string   "type"
    t.string   "number",        :null => false
    t.integer  "offense_id"
    t.integer  "location_id"
    t.date     "date"
    t.datetime "dispatched_at"
    t.datetime "arrived_at"
    t.datetime "cleared_at"
    t.integer  "received_id"
    t.text     "narrative"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.string   "code"
    t.string   "local_code"
    t.integer  "country_id"
    t.string   "abbreviation"
    t.string   "name"
    t.boolean  "active",       :default => true
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

  create_table "street_names", :force => true do |t|
    t.string   "code"
    t.string   "local_code"
    t.integer  "county_id"
    t.string   "name"
    t.boolean  "active",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.boolean  "active",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                          :null => false
    t.string   "crypted_password"
    t.string   "salt"
    t.integer  "failed_logins_count",          :default => 0
    t.integer  "lock_expires_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "first_name",                   :default => ""
    t.string   "last_name",                    :default => ""
    t.string   "badge_number"
    t.boolean  "active",                       :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"

end
