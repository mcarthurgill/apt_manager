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

ActiveRecord::Schema.define(:version => 20131112160511) do

  create_table "faqs", :force => true do |t|
    t.string   "question"
    t.string   "answer"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "images", :force => true do |t|
    t.integer  "rental_id"
    t.string   "file"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "maintenance_requests", :force => true do |t|
    t.integer  "user_id"
    t.integer  "rental_id"
    t.text     "request"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "complete",   :default => false
  end

  create_table "pdfs", :force => true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.integer  "rental_id"
    t.string   "file"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rentals", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "rent"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin"
    t.string   "phone"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
