# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_24_205016) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drafts", force: :cascade do |t|
    t.string "name"
    t.integer "roster_config_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "franchise_players", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "franchise_id", null: false
    t.integer "salary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "tier"
    t.index ["franchise_id"], name: "index_franchise_players_on_franchise_id"
    t.index ["player_id"], name: "index_franchise_players_on_player_id"
  end

  create_table "franchises", force: :cascade do |t|
    t.string "name"
    t.integer "budget"
    t.bigint "draft_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "draft_position"
    t.boolean "is_nominating"
    t.index ["draft_id"], name: "index_franchises_on_draft_id"
  end

  create_table "opponent_players", force: :cascade do |t|
    t.bigint "opponent_id", null: false
    t.integer "salary"
    t.bigint "player_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["opponent_id"], name: "index_opponent_players_on_opponent_id"
    t.index ["player_id"], name: "index_opponent_players_on_player_id"
  end

  create_table "opponents", force: :cascade do |t|
    t.string "name"
    t.integer "bidding_aggression"
    t.integer "penalties"
    t.string "team_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "pro_team"
    t.string "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ranking_players", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "ranking_id", null: false
    t.integer "value"
    t.integer "tier"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_ranking_players_on_player_id"
    t.index ["ranking_id"], name: "index_ranking_players_on_ranking_id"
  end

  create_table "rankings", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roster_configs", force: :cascade do |t|
    t.string "name"
    t.integer "qb"
    t.integer "rb"
    t.integer "wr"
    t.integer "te"
    t.integer "def"
    t.integer "k"
    t.integer "rb_wr"
    t.integer "wr_te"
    t.integer "superflex"
    t.integer "flex"
    t.integer "bench"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "franchise_players", "franchises"
  add_foreign_key "franchise_players", "players"
  add_foreign_key "franchises", "drafts"
  add_foreign_key "opponent_players", "opponents"
  add_foreign_key "opponent_players", "players"
  add_foreign_key "ranking_players", "players"
  add_foreign_key "ranking_players", "rankings"
end
