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

ActiveRecord::Schema.define(:version => 20130622044035) do

  create_table "games", :force => true do |t|
    t.decimal  "amount",       :precision => 10, :scale => 2
    t.integer  "user_id"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.decimal  "buy_in",       :precision => 10, :scale => 2
    t.decimal  "cash_out",     :precision => 10, :scale => 2
    t.decimal  "difference",   :precision => 10, :scale => 2
    t.integer  "players"
    t.integer  "roll_id"
    t.date     "date_played"
    t.decimal  "hours_played", :precision => 2,  :scale => 4
  end

  add_index "games", ["roll_id"], :name => "index_games_on_roll_id"

  create_table "rolls", :force => true do |t|
    t.decimal  "amount",     :precision => 10, :scale => 2
    t.integer  "user_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "site_name"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
