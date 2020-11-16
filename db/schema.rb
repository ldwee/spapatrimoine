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

ActiveRecord::Schema.define(version: 2020_11_16_070700) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.text "description"
    t.date "date"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.text "image"
    t.bigint "activity_type_id"
    t.bigint "activity_place_id"
    t.bigint "patrimoine_id"
    t.bigint "contributor_id"
    t.index ["activity_place_id"], name: "index_activities_on_activity_place_id"
    t.index ["activity_type_id"], name: "index_activities_on_activity_type_id"
    t.index ["contributor_id"], name: "index_activities_on_contributor_id"
    t.index ["patrimoine_id"], name: "index_activities_on_patrimoine_id"
  end

  create_table "activity_places", force: :cascade do |t|
    t.string "Name"
    t.string "Address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "activity_types", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "actualities", force: :cascade do |t|
    t.string "titre"
    t.text "description"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "image"
    t.bigint "activity_id"
    t.bigint "patrimoine_id"
    t.bigint "contributor_id"
    t.index ["activity_id"], name: "index_actualities_on_activity_id"
    t.index ["contributor_id"], name: "index_actualities_on_contributor_id"
    t.index ["patrimoine_id"], name: "index_actualities_on_patrimoine_id"
  end

  create_table "contributors", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "patrimoines", force: :cascade do |t|
    t.string "libelle"
    t.string "localisation"
    t.string "inscription"
    t.string "categorie"
    t.string "notice"
    t.text "etat"
    t.boolean "endangered"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.string "ipic"
    t.bigint "contributor_id"
    t.float "latitude"
    t.float "longitude"
    t.index ["contributor_id"], name: "index_patrimoines_on_contributor_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string "nom"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.string "firstname"
    t.string "lastname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "activities", "activity_places"
  add_foreign_key "activities", "activity_types"
  add_foreign_key "activities", "contributors"
  add_foreign_key "activities", "patrimoines"
  add_foreign_key "actualities", "activities"
  add_foreign_key "actualities", "contributors"
  add_foreign_key "actualities", "patrimoines"
  add_foreign_key "patrimoines", "contributors"
end
