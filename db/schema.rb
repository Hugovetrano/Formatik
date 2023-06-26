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

ActiveRecord::Schema[7.0].define(version: 2023_06_26_134255) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apprenants", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.string "email"
    t.string "profession"
    t.string "adresse_facturation"
    t.string "code_postal"
    t.string "ville"
    t.string "telephone"
    t.string "niveau_etude"
    t.bigint "entreprise_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "genre"
    t.index ["entreprise_id"], name: "index_apprenants_on_entreprise_id"
  end

  create_table "entreprises", force: :cascade do |t|
    t.string "nom"
    t.string "siret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inscriptions", force: :cascade do |t|
    t.bigint "apprenant_id", null: false
    t.bigint "session_id", null: false
    t.bigint "parcoursadmin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apprenant_id"], name: "index_inscriptions_on_apprenant_id"
    t.index ["parcoursadmin_id"], name: "index_inscriptions_on_parcoursadmin_id"
    t.index ["session_id"], name: "index_inscriptions_on_session_id"
  end

  create_table "intervenants", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.string "email"
    t.string "adresse"
    t.string "code_postal"
    t.string "ville"
    t.string "telephone"
    t.string "num_da"
    t.string "siret"
    t.integer "tarif"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "genre"
  end

  create_table "parcoursadmins", force: :cascade do |t|
    t.string "devis_envoye", default: "f"
    t.string "devis_valide", default: "f"
    t.string "contrat_envoye", default: "f"
    t.string "contrat_signe", default: "f"
    t.string "convocation_envoye", default: "f"
    t.string "emargement", default: "f"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programmes", force: :cascade do |t|
    t.string "titre"
    t.string "description"
    t.integer "prix"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "date_debut"
    t.datetime "date_fin"
    t.string "nom"
    t.bigint "programme_id", null: false
    t.bigint "intervenant_id", null: false
    t.integer "prix"
    t.string "adresse"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["intervenant_id"], name: "index_sessions_on_intervenant_id"
    t.index ["programme_id"], name: "index_sessions_on_programme_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nom"
    t.string "prenom"
    t.string "fonction"
    t.string "genre"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "apprenants", "entreprises"
  add_foreign_key "inscriptions", "apprenants"
  add_foreign_key "inscriptions", "parcoursadmins"
  add_foreign_key "inscriptions", "sessions"
  add_foreign_key "sessions", "intervenants"
  add_foreign_key "sessions", "programmes"
end
