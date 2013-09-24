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

ActiveRecord::Schema.define(:version => 20130924213856) do

  create_table "ratings", :force => true do |t|
    t.integer  "rating"
    t.text     "comment"
    t.integer  "speaker_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "speakers", :force => true do |t|
    t.text     "name"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.text     "presentation",   :limit => 255,  :default => "", :null => false
    t.string   "description",    :limit => 1024
    t.boolean  "visible"
    t.text     "bio",            :limit => 255
    t.integer  "time_slot_id"
    t.string   "language"
    t.integer  "average_rating"
    t.integer  "venue_id"
  end

  create_table "time_slots", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.datetime "start_time"
    t.datetime "end_time"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "venues", :force => true do |t|
    t.string "name"
  end

  create_table "votes", :force => true do |t|
    t.boolean  "isup"
    t.integer  "speaker_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "uuid"
  end

  add_index "votes", ["speaker_id"], :name => "index_votes_on_speaker_id"

end
