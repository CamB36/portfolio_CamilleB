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

ActiveRecord::Schema[7.1].define(version: 2025_04_15_172126) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "competences", force: :cascade do |t|
    t.string "title"
    t.string "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id", null: false
    t.string "logo"
    t.boolean "useTitle"
    t.index ["category_id"], name: "index_competences_on_category_id"
  end

  create_table "competences_projets", id: false, force: :cascade do |t|
    t.bigint "projet_id", null: false
    t.bigint "competence_id", null: false
    t.index ["competence_id"], name: "index_competences_projets_on_competence_id"
    t.index ["projet_id"], name: "index_competences_projets_on_projet_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "link"
    t.string "picture"
    t.date "date"
    t.date "endDate"
    t.string "company"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "formations", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "link"
    t.string "picture"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "endDate"
    t.string "ecole"
  end

  create_table "projets", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "dateStart"
    t.date "dateEnd"
    t.string "projet_type"
    t.string "reference"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
