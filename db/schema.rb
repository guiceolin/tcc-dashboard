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

ActiveRecord::Schema.define(:version => 20111112235757) do

  create_table "deliveries", :force => true do |t|
    t.integer  "message_id"
    t.integer  "user_id"
    t.boolean  "read"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "archived",   :default => false
  end

  create_table "documents", :force => true do |t|
    t.integer  "project_id"
    t.text     "description"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "keys", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.text     "key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "master_projects", :force => true do |t|
    t.integer  "owner_id"
    t.text     "description"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "end_date"
  end

  create_table "memberships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.boolean  "manager",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.integer  "sender_id"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "master_project_id"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.integer  "master_project_id"
    t.boolean  "finished"
  end

  create_table "tasks", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                    :default => "",       :null => false
    t.string   "encrypted_password",        :limit => 128, :default => "",       :null => false
    t.string   "password_salt",                            :default => "",       :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                            :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "roles_mask"
    t.string   "type",                                     :default => "Member", :null => false
    t.integer  "current_project_id"
    t.integer  "current_master_project_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "versions", :force => true do |t|
    t.string   "item_type",      :null => false
    t.integer  "item_id",        :null => false
    t.string   "event",          :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

end
