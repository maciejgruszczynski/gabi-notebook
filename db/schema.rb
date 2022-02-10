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

ActiveRecord::Schema.define(version: 2022_02_10_115212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "search_notebooks", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "search_queries", force: :cascade do |t|
    t.string "query", null: false
    t.integer "hits_count", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "search_result_id"
    t.index ["search_result_id"], name: "index_search_queries_on_search_result_id"
  end

  create_table "search_results", force: :cascade do |t|
    t.string "author"
    t.integer "karma_points", default: 0, null: false
    t.string "url"
    t.datetime "creation_date", precision: 6
    t.string "tags"
    t.bigint "search_notebook_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["search_notebook_id"], name: "index_search_results_on_search_notebook_id"
  end

  add_foreign_key "search_queries", "search_results"
  add_foreign_key "search_results", "search_notebooks"
end
