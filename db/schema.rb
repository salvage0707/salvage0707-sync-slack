# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_07_19_153058) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "slack_teams", force: :cascade do |t|
    t.string "uuid", null: false, comment: "slack teamのuuid"
    t.string "name", default: "", null: false, comment: "slack team名"
    t.string "icon_url", comment: "slack teamのアイコンURL"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uuid"], name: "index_slack_teams_on_uuid", unique: true
  end

  create_table "slack_users", force: :cascade do |t|
    t.string "uuid", null: false, comment: "slack uuid"
    t.string "username", default: "", null: false, comment: "slack user名"
    t.string "email", default: "", null: false, comment: "メールアドレス"
    t.string "image_url", comment: "アイコンURL"
    t.bigint "user_id", null: false
    t.bigint "slack_team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slack_team_id"], name: "index_slack_users_on_slack_team_id"
    t.index ["user_id"], name: "index_slack_users_on_user_id"
    t.index ["uuid"], name: "index_slack_users_on_uuid", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "slack_users", "slack_teams"
  add_foreign_key "slack_users", "users"
end
