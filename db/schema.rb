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

ActiveRecord::Schema.define(version: 20160927065029) do

  create_table "acc_system_checkpoints", force: :cascade do |t|
    t.integer  "acc_system_id", limit: 4
    t.datetime "time_stamp"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "acc_system_checkpoints", ["acc_system_id"], name: "index_acc_system_checkpoints_on_acc_system_id"

  create_table "acc_systems", force: :cascade do |t|
    t.string   "name",       limit: 30
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "api_keys", force: :cascade do |t|
    t.string   "key",           limit: 100
    t.string   "name",          limit: 100
    t.integer  "acc_system_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "api_keys", ["acc_system_id"], name: "index_api_keys_on_acc_system_id"

  create_table "client_contact_syncs", force: :cascade do |t|
    t.integer  "client_contact_id", limit: 4
    t.datetime "time_stamp"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "acc_system_id",     limit: 4
  end

  add_index "client_contact_syncs", ["acc_system_id"], name: "index_client_contact_syncs_on_acc_system_id"
  add_index "client_contact_syncs", ["client_contact_id"], name: "index_client_contact_syncs_on_client_contact_id"

  create_table "client_contacts", force: :cascade do |t|
    t.integer  "person_id",  limit: 4
    t.integer  "client_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "client_contacts", ["client_id"], name: "index_client_contacts_on_client_id"
  add_index "client_contacts", ["person_id"], name: "index_client_contacts_on_person_id"

  create_table "client_document_syncs", force: :cascade do |t|
    t.integer  "client_document_id", limit: 4
    t.datetime "time_stamp"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "acc_system_id",      limit: 4
  end

  add_index "client_document_syncs", ["acc_system_id"], name: "index_client_document_syncs_on_acc_system_id"
  add_index "client_document_syncs", ["client_document_id"], name: "index_client_document_syncs_on_client_document_id"

  create_table "client_documents", force: :cascade do |t|
    t.integer  "doc_type_id", limit: 4
    t.integer  "client_id",   limit: 4
    t.string   "doc_serial",  limit: 20
    t.string   "doc_number",  limit: 20
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "client_documents", ["client_id"], name: "index_client_documents_on_client_id"
  add_index "client_documents", ["doc_type_id"], name: "index_client_documents_on_doc_type_id"

  create_table "client_syncs", force: :cascade do |t|
    t.integer  "client_id",     limit: 4
    t.integer  "acc_system_id", limit: 4
    t.datetime "time_stamp"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "client_syncs", ["acc_system_id"], name: "index_client_syncs_on_acc_system_id"
  add_index "client_syncs", ["client_id"], name: "index_client_syncs_on_client_id"

  create_table "client_types", force: :cascade do |t|
    t.string   "name",       limit: 30
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "client_warehouses", force: :cascade do |t|
    t.integer  "client_id",    limit: 4
    t.integer  "warehouse_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "client_warehouses", ["client_id"], name: "index_client_warehouses_on_client_id"
  add_index "client_warehouses", ["warehouse_id"], name: "index_client_warehouses_on_warehouse_id"

  create_table "clients", force: :cascade do |t|
    t.string   "name",           limit: 150
    t.string   "first_name",     limit: 40
    t.string   "second_name",    limit: 40
    t.string   "last_name",      limit: 40
    t.string   "cellphone",      limit: 12
    t.string   "okpo",           limit: 10
    t.string   "inn",            limit: 10
    t.integer  "client_type_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "clients", ["client_type_id"], name: "index_clients_on_client_type_id"

  create_table "clients_nonactivities", force: :cascade do |t|
    t.integer  "client_id",     limit: 4
    t.integer  "acc_system_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "clients_nonactivities", ["acc_system_id"], name: "index_clients_nonactivities_on_acc_system_id"
  add_index "clients_nonactivities", ["client_id"], name: "index_clients_nonactivities_on_client_id"

  create_table "doc_types", force: :cascade do |t|
    t.string   "name",       limit: 20
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "locks", force: :cascade do |t|
    t.integer  "acc_system_id", limit: 4
    t.datetime "time_stamp"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "client_id",     limit: 4
  end

  add_index "locks", ["acc_system_id"], name: "index_locks_on_acc_system_id"
  add_index "locks", ["client_id"], name: "index_locks_on_client_id"

  create_table "main_systems", force: :cascade do |t|
    t.datetime "time_stamp"
    t.integer  "acc_system_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "main_systems", ["acc_system_id"], name: "index_main_systems_on_acc_system_id"

  create_table "people", force: :cascade do |t|
    t.string   "name",        limit: 150
    t.string   "first_name",  limit: 40
    t.string   "second_name", limit: 40
    t.string   "last_name",   limit: 40
    t.string   "cellphone",   limit: 12
    t.string   "inn",         limit: 10
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "person_syncs", force: :cascade do |t|
    t.integer  "person_id",     limit: 4
    t.datetime "time_stamp"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "acc_system_id", limit: 4
  end

  add_index "person_syncs", ["acc_system_id"], name: "index_person_syncs_on_acc_system_id"
  add_index "person_syncs", ["person_id"], name: "index_person_syncs_on_person_id"

  create_table "warehouses", force: :cascade do |t|
    t.string   "name",          limit: 50
    t.integer  "warehouse_key", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_foreign_key "acc_system_checkpoints", "acc_systems"
  add_foreign_key "api_keys", "acc_systems"
  add_foreign_key "client_contact_syncs", "acc_systems"
  add_foreign_key "client_contact_syncs", "client_contacts"
  add_foreign_key "client_contacts", "clients"
  add_foreign_key "client_contacts", "people"
  add_foreign_key "client_document_syncs", "acc_systems"
  add_foreign_key "client_document_syncs", "client_documents"
  add_foreign_key "client_documents", "clients"
  add_foreign_key "client_documents", "doc_types"
  add_foreign_key "client_syncs", "acc_systems"
  add_foreign_key "client_syncs", "clients"
  add_foreign_key "client_warehouses", "clients"
  add_foreign_key "client_warehouses", "warehouses"
  add_foreign_key "clients", "client_types"
  add_foreign_key "clients_nonactivities", "acc_systems"
  add_foreign_key "clients_nonactivities", "clients"
  add_foreign_key "locks", "acc_systems"
  add_foreign_key "locks", "clients"
  add_foreign_key "main_systems", "acc_systems"
  add_foreign_key "person_syncs", "acc_systems"
  add_foreign_key "person_syncs", "people"
end
