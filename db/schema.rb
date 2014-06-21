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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acted_in", primary_key: "idacted_in", force: true do |t|
    t.integer "idmovies",                      null: false
    t.integer "idseries"
    t.integer "idactors",                      null: false
    t.string  "character",        limit: 1023
    t.integer "billing_position"
  end

  create_table "actors", id: false, force: true do |t|
    t.integer "idactors",              null: false
    t.string  "lname",    limit: 1023
    t.string  "fname",    limit: 1023, null: false
    t.string  "mname",    limit: 1023
    t.integer "gender"
    t.integer "number"
  end

  create_table "aka_names", primary_key: "idaka_names", force: true do |t|
    t.integer "idactors",              null: false
    t.string  "name",     limit: 1023, null: false
  end

  create_table "aka_titles", primary_key: "idaka_titles", force: true do |t|
    t.integer "idmovies",              null: false
    t.string  "title",    limit: 1023, null: false
    t.string  "location", limit: 63
    t.integer "year"
  end

  create_table "genres", id: false, force: true do |t|
    t.integer "idgenres",             null: false
    t.string  "genre",    limit: 511, null: false
  end

  create_table "keywords", id: false, force: true do |t|
    t.integer "idkeywords", null: false
    t.string  "keyword",    null: false
  end

  create_table "movies", id: false, force: true do |t|
    t.integer "idmovies",              null: false
    t.string  "title",    limit: 1023, null: false
    t.integer "year"
    t.integer "number"
    t.integer "type"
    t.string  "location", limit: 63
    t.string  "language", limit: 63
  end

  create_table "movies_genres", primary_key: "idmovies_genres", force: true do |t|
    t.integer "idmovies", null: false
    t.integer "idgenres", null: false
    t.integer "idseries"
  end

  create_table "movies_keywords", primary_key: "idmovies_keywords", force: true do |t|
    t.integer "idmovies",   null: false
    t.integer "idkeywords", null: false
    t.integer "idseries"
  end

  create_table "series", id: false, force: true do |t|
    t.integer "idseries",              null: false
    t.integer "idmovies",              null: false
    t.string  "name",     limit: 1023
    t.integer "season"
    t.integer "number"
  end

end
