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

ActiveRecord::Schema.define(version: 20161213173113) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "colleges", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.text     "course_number"
    t.text     "course_title"
    t.integer  "enrollment"
    t.integer  "year"
    t.text     "semester"
    t.text     "evaluation_results"
    t.boolean  "taught"
    t.integer  "report_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["report_id"], name: "index_courses_on_report_id", using: :btree
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.integer  "college_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["college_id"], name: "index_departments_on_college_id", using: :btree
  end

  create_table "grant_principle_investigators", force: :cascade do |t|
    t.text     "first_name"
    t.text     "middle_name"
    t.text     "last_name"
    t.text     "banner_id"
    t.integer  "person_id"
    t.integer  "grant_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["grant_id"], name: "index_grant_principle_investigators_on_grant_id", using: :btree
    t.index ["person_id"], name: "index_grant_principle_investigators_on_person_id", using: :btree
  end

  create_table "grants", force: :cascade do |t|
    t.integer  "status"
    t.text     "title"
    t.text     "duration"
    t.decimal  "total_funding"
    t.decimal  "unm_portion"
    t.decimal  "soe_portion"
    t.text     "granscol"
    t.integer  "report_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["report_id"], name: "index_grants_on_report_id", using: :btree
  end

  create_table "mentees", force: :cascade do |t|
    t.integer  "mentee_type"
    t.text     "first_name"
    t.text     "middle_name"
    t.text     "last_name"
    t.text     "banner_id"
    t.text     "study_stage"
    t.datetime "expected_graduation"
    t.text     "support_source"
    t.text     "placement"
    t.integer  "report_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["report_id"], name: "index_mentees_on_report_id", using: :btree
  end

  create_table "outreach_activities", force: :cascade do |t|
    t.text     "name"
    t.text     "description"
    t.integer  "report_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["report_id"], name: "index_outreach_activities_on_report_id", using: :btree
  end

  create_table "people", force: :cascade do |t|
    t.text     "banner_id"
    t.text     "net_id"
    t.text     "first_name"
    t.text     "last_name"
    t.text     "position"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "department_id"
    t.index ["department_id"], name: "index_people_on_department_id", using: :btree
  end

  create_table "people_roles", id: false, force: :cascade do |t|
    t.integer "person_id"
    t.integer "role_id"
    t.index ["person_id", "role_id"], name: "index_people_roles_on_person_id_and_role_id", using: :btree
  end

  create_table "professional_services", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.integer  "type"
    t.integer  "report_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["report_id"], name: "index_professional_services_on_report_id", using: :btree
  end

  create_table "publications", force: :cascade do |t|
    t.text    "publication_type"
    t.text    "body"
    t.text    "url"
    t.integer "report_id"
    t.index ["report_id"], name: "index_publications_on_report_id", using: :btree
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "report_year"
    t.integer  "rank"
    t.text     "department"
    t.text     "self_evaluation_text"
    t.text     "future_plans_text"
    t.integer  "person_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["person_id"], name: "index_reports_on_person_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", using: :btree
  end

  create_table "university_services", force: :cascade do |t|
    t.text     "position"
    t.integer  "type"
    t.text     "description"
    t.integer  "report_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["report_id"], name: "index_university_services_on_report_id", using: :btree
  end

  add_foreign_key "courses", "reports"
  add_foreign_key "departments", "colleges"
  add_foreign_key "grant_principle_investigators", "grants"
  add_foreign_key "grant_principle_investigators", "people"
  add_foreign_key "grants", "reports"
  add_foreign_key "mentees", "reports"
  add_foreign_key "outreach_activities", "reports"
  add_foreign_key "people", "departments"
  add_foreign_key "professional_services", "reports"
  add_foreign_key "publications", "reports"
  add_foreign_key "reports", "people"
  add_foreign_key "university_services", "reports"
end
