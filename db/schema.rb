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

ActiveRecord::Schema[7.0].define(version: 2023_07_14_195040) do
  create_table "gitlab_users", force: :cascade do |t|
    t.string "name"
    t.integer "gitlab_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gitlab_id"], name: "index_gitlab_users_on_gitlab_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", null: false
    t.string "uid", null: false
    t.string "name"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true
    t.index ["provider"], name: "index_users_on_provider"
    t.index ["uid"], name: "index_users_on_uid"
  end

  create_table "webhook_targets", force: :cascade do |t|
    t.string "repository"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "last_called_at"
    t.integer "user_id", null: false
    t.index ["token"], name: "index_webhook_targets_on_token", unique: true
    t.index ["user_id"], name: "index_webhook_targets_on_user_id"
  end

  add_foreign_key "webhook_targets", "users"
end
