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

ActiveRecord::Schema.define(:version => 20120930092035) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "assignments", :force => true do |t|
    t.integer  "origin_id"
    t.integer  "cat_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "assignments", ["cat_id"], :name => "index_assignments_on_cat_id"
  add_index "assignments", ["origin_id"], :name => "index_assignments_on_origin_id"

  create_table "categories", :force => true do |t|
    t.string   "page_type"
    t.integer  "cat_id"
    t.string   "name"
    t.text     "description"
    t.text     "disclaimer"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "categories", ["cat_id"], :name => "index_categories_on_cat_id"

  create_table "products", :force => true do |t|
    t.integer  "origin_id"
    t.string   "name"
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
    t.datetime "last_updated"
    t.text     "description"
    t.text     "short_description"
    t.string   "image_path"
    t.string   "url"
    t.string   "intro_apr"
    t.string   "q_intro_apr"
    t.string   "intro_apr_period"
    t.string   "q_intro_apr_period"
    t.string   "regular_apr"
    t.string   "q_regular_apr"
    t.string   "annual_fee"
    t.string   "q_annual_fee"
    t.string   "credit_needed"
    t.string   "q_credit_needed"
    t.string   "balance_transfers"
    t.string   "q_balance_transfers"
    t.string   "transfer_fee_pin"
    t.string   "q_transfer_fee_pin"
    t.string   "transaction_fee_signature"
    t.string   "q_transaction_fee_signature"
    t.string   "load_fee"
    t.string   "q_load_fee"
    t.string   "atm_fee"
    t.string   "q_atm_fee"
    t.string   "activation_fee"
    t.string   "q_activation_fee"
    t.string   "balance_transfer_intro_apr"
    t.string   "q_balance_transfer_intro_apr"
    t.string   "balance_transfer_intro_apr_period"
    t.string   "q_balance_transfer_intro_apr_period"
    t.string   "balance_transfer_goto_rate"
    t.string   "q_balance_transfer_goto_rate"
    t.string   "cash_advance_goto_rate"
    t.string   "q_cash_advance_goto_rate"
    t.string   "penalty_goto_rate"
    t.string   "q_penalty_goto_rate"
    t.string   "late_fee"
    t.string   "q_late_fee"
    t.string   "cash_advance_fee"
    t.string   "q_cash_advance_fee"
    t.string   "balance_transfer_fee"
    t.string   "q_balance_transfer_fee"
    t.string   "foreign_currency_exchange_fee"
    t.string   "q_foreign_currency_exchange_fee"
    t.string   "issuer"
    t.boolean  "feature_flag",                        :default => false
    t.boolean  "popular_flag",                        :default => false
    t.boolean  "low_apr_feature_flag",                :default => false
    t.boolean  "rewards_feature_flag",                :default => false
    t.boolean  "business_feature_flag",               :default => false
    t.boolean  "bad_credit_feature_flag",             :default => false
    t.boolean  "student_feature_flag",                :default => false
  end

  add_index "products", ["origin_id"], :name => "index_products_on_origin_id"

end
