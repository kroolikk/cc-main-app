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

ActiveRecord::Schema.define(:version => 20130320220348) do

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "photos", :force => true do |t|
    t.integer  "post_id"
    t.string   "title"
    t.string   "photo"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "photos", ["slug"], :name => "index_photos_on_slug", :unique => true

  create_table "places", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "street"
    t.string   "street_no"
    t.string   "zip_code"
    t.boolean  "detect_coords", :default => true
    t.float    "latitude"
    t.float    "longitude"
    t.text     "description"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "phone"
    t.string   "website"
    t.text     "opening_hours"
    t.text     "info"
    t.string   "slug"
    t.string   "image"
    t.string   "email"
    t.integer  "category_id"
  end

  add_index "places", ["category_id"], :name => "index_places_on_category_id"
  add_index "places", ["slug"], :name => "index_places_on_slug", :unique => true

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "start_date"
    t.string   "slug"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "promoted",     :default => 0
    t.integer  "category_id"
    t.text     "lead"
    t.integer  "place_id"
    t.string   "author"
    t.integer  "size",         :default => 0
    t.boolean  "is_event"
    t.datetime "event_start"
    t.text     "list_of_tags"
  end

  add_index "posts", ["category_id"], :name => "index_posts_on_category_id"
  add_index "posts", ["is_event"], :name => "index_posts_on_is_event"
  add_index "posts", ["place_id"], :name => "index_posts_on_place_id"
  add_index "posts", ["promoted"], :name => "index_posts_on_promoted"
  add_index "posts", ["slug"], :name => "index_posts_on_slug", :unique => true

  create_table "preferences", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",     :null => false
    t.string   "encrypted_password",     :default => "",     :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "role",                   :default => "user"
    t.string   "slug"
    t.string   "name"
    t.string   "avatar"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "image"
    t.string   "nick"
    t.string   "surname"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["role"], :name => "index_users_on_role"
  add_index "users", ["slug"], :name => "index_users_on_slug", :unique => true

  create_table "users_preferences", :force => true do |t|
    t.string   "user_id"
    t.string   "preference_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
