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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130722200524) do

  create_table "circles", force: true do |t|
    t.integer  "game_id"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "circles", ["game_id"], name: "index_circles_on_game_id"

  create_table "extra_jobs", force: true do |t|
    t.integer  "game_id"
    t.integer  "killer_id"
    t.integer  "victim_id"
    t.string   "key"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "extra_jobs", ["game_id"], name: "index_extra_jobs_on_game_id"
  add_index "extra_jobs", ["killer_id"], name: "index_extra_jobs_on_killer_id"
  add_index "extra_jobs", ["victim_id"], name: "index_extra_jobs_on_victim_id"

  create_table "games", force: true do |t|
    t.integer  "gamemaster_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.time     "starttime"
    t.time     "endtime"
    t.boolean  "tweet"
  end

  add_index "games", ["gamemaster_id"], name: "index_games_on_gamemaster_id"

  create_table "jobs", force: true do |t|
    t.integer  "circle_id"
    t.integer  "killer_id"
    t.integer  "victim_id"
    t.string   "key"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "jobs", ["circle_id"], name: "index_jobs_on_circle_id"
  add_index "jobs", ["killer_id"], name: "index_jobs_on_killer_id"
  add_index "jobs", ["victim_id"], name: "index_jobs_on_victim_id"

  create_table "players", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["game_id"], name: "index_players_on_game_id"
  add_index "players", ["user_id"], name: "index_players_on_user_id"

  create_table "users", force: true do |t|
    t.string   "username",                        null: false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "name"
    t.string   "surname"
  end

  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token"

end
