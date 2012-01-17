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

ActiveRecord::Schema.define(:version => 20120110021302) do

  create_table "applications", :force => true do |t|
    t.integer  "applicant_id"
    t.integer  "committee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "form_data"
  end

  add_index "applications", ["applicant_id"], :name => "index_applications_on_applicant_id"
  add_index "applications", ["committee_id"], :name => "index_applications_on_committee_id"

  create_table "committees", :force => true do |t|
    t.string   "name"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "contact_info"
    t.string   "website"
    t.integer  "section_id"
    t.boolean  "applications_open",     :default => true
    t.boolean  "use_default_questions", :default => true
  end

  add_index "committees", ["section_id"], :name => "index_committees_on_section_id"

  create_table "nominations", :force => true do |t|
    t.integer  "committee_id", :null => false
    t.integer  "nominator_id", :null => false
    t.integer  "nominee_id",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "form_data"
  end

  add_index "nominations", ["committee_id"], :name => "index_nominations_on_committee_id"
  add_index "nominations", ["nominator_id"], :name => "index_nominations_on_nominator_id"
  add_index "nominations", ["nominee_id"], :name => "index_nominations_on_nominee_id"

  create_table "questions", :force => true do |t|
    t.string   "type"
    t.text     "text"
    t.boolean  "for_nominator"
    t.boolean  "for_applicant"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "committee_id"
  end

  add_index "questions", ["committee_id"], :name => "index_questions_on_committee_id"

  create_table "sections", :force => true do |t|
    t.string   "name"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "site_contents", :force => true do |t|
    t.string   "name"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "users", :force => true do |t|
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.string   "username",            :default => "",    :null => false
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "is_admin",            :default => false, :null => false
    t.boolean  "is_readonly",         :default => true,  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone_number"
  end

  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
