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

ActiveRecord::Schema.define(version: 20191115032040) do

  create_table "cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",     null: false
    t.string   "customer_id", null: false
    t.string   "card_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "parent_id"
    t.string   "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry", using: :btree
  end

  create_table "credits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "number",          null: false
    t.date     "expiration_date", null: false
    t.integer  "security_code",   null: false
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["user_id"], name: "index_credits_on_user_id", using: :btree
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "image",      limit: 65535, null: false
    t.integer  "product_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["product_id"], name: "index_images_on_product_id", using: :btree
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                           null: false
    t.integer  "price",                          null: false
    t.integer  "condition",                      null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.text     "explanation",      limit: 65535
    t.integer  "delivery_date"
    t.integer  "delivery_fee_pay"
    t.integer  "region"
    t.integer  "category_id"
    t.integer  "seller_id",                      null: false
    t.integer  "buyer_id"
    t.index ["buyer_id"], name: "index_products_on_buyer_id", using: :btree
    t.index ["seller_id"], name: "index_products_on_seller_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "first_name",                                        null: false
    t.string   "last_name",                                         null: false
    t.string   "first_name_kata",                                   null: false
    t.string   "last_name_kata",                                    null: false
    t.string   "nickname",                                          null: false
    t.text     "image",                  limit: 65535
    t.text     "profiel_message",        limit: 65535
    t.string   "num_of_exihibits"
    t.string   "phone_number",                                      null: false
    t.string   "post_code",                                         null: false
    t.string   "prefecture",                                        null: false
    t.string   "city_village_town",                                 null: false
    t.string   "house_number",                                      null: false
    t.string   "building",                                          null: false
    t.date     "birthday"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "credits", "users"
  add_foreign_key "images", "products"
  add_foreign_key "products", "users", column: "buyer_id"
  add_foreign_key "products", "users", column: "seller_id"
end
