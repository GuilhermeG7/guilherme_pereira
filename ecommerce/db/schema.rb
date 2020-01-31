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

ActiveRecord::Schema.define(version: 20200129185146) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categorias", force: true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pessoas_enderecos", force: true do |t|
    t.string   "nome",       null: false
    t.string   "rua",        null: false
    t.string   "bairro",     null: false
    t.string   "cidade",     null: false
    t.string   "uf",         null: false
    t.string   "cep",        null: false
    t.integer  "numero",     null: false
    t.integer  "produto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pessoas_enderecos", ["produto_id"], name: "index_pessoas_enderecos_on_produto_id", using: :btree

  create_table "produtos", force: true do |t|
    t.string   "descricao",                                                null: false
    t.string   "imagem_produto"
    t.boolean  "ativo",                                    default: false, null: false
    t.boolean  "promocao",                                 default: false, null: false
    t.integer  "estoque",                                  default: 0,     null: false
    t.integer  "numero_parcelas",                          default: 1,     null: false
    t.decimal  "valor",           precision: 12, scale: 2, default: 0.0
    t.decimal  "valor_promocao",  precision: 12, scale: 2, default: 0.0
    t.integer  "categoria_id",                                             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "produtos", ["categoria_id"], name: "index_produtos_on_categoria_id", using: :btree

end
