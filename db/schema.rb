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

ActiveRecord::Schema[7.0].define(version: 2023_02_22_191922) do
  create_table "episodes", force: :cascade do |t|
    t.string "title"
    t.string "plot"
    t.integer "number"
    t.integer "season_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["season_id"], name: "index_episodes_on_season_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "plot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "purchase_options_id"
    t.index ["purchase_options_id"], name: "index_movies_on_purchase_options_id"
  end

  create_table "purchase_options", force: :cascade do |t|
    t.float "price", default: 2.99
    t.integer "video_quality"
    t.string "payment_type"
    t.integer "payment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_type", "payment_id"], name: "index_purchase_options_on_payment"
  end

  create_table "purchases", force: :cascade do |t|
    t.string "content_type"
    t.integer "content_id"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "expiration_date"
    t.integer "video_quality"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "title"
    t.string "plot"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "purchase_options_id"
    t.index ["purchase_options_id"], name: "index_seasons_on_purchase_options_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "episodes", "seasons"
end
