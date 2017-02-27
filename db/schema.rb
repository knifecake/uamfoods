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

ActiveRecord::Schema.define(version: 20170227163152) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cafeterias", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "hours"
    t.string   "phone"
    t.boolean  "needs_mentor"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "image_url"
    t.string   "contributor_name"
    t.date     "last_contribution_date"
    t.string   "slug"
    t.index ["slug"], name: "index_cafeterias_on_slug"
  end

  create_table "dish_menus", force: :cascade do |t|
    t.integer  "menu_id"
    t.integer  "dish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "course"
    t.index ["dish_id"], name: "index_dish_menus_on_dish_id"
    t.index ["menu_id"], name: "index_dish_menus_on_menu_id"
  end

  create_table "dish_votes", force: :cascade do |t|
    t.integer  "dish_id"
    t.integer  "user_id"
    t.datetime "voted_at"
    t.integer  "value"
    t.index ["dish_id"], name: "index_dish_votes_on_dish_id"
    t.index ["user_id"], name: "index_dish_votes_on_user_id"
  end

  create_table "dishes", force: :cascade do |t|
    t.string   "name"
    t.integer  "cafeteria_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "upvotes"
    t.integer  "downvotes"
    t.index ["cafeteria_id"], name: "index_dishes_on_cafeteria_id"
  end

  create_table "menus", force: :cascade do |t|
    t.integer  "cafeteria_id"
    t.date     "served_at"
    t.string   "meal"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["cafeteria_id"], name: "index_menus_on_cafeteria_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
