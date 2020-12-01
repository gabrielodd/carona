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

ActiveRecord::Schema.define(version: 2020_11_27_192732) do

  create_table "admins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nome"
    t.boolean "ativo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dados_identificacoes_id"
    t.datetime "data_desativacao"
  end

  create_table "campus_uffs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nome"
    t.string "endereco"
    t.string "numero"
    t.string "bairro"
    t.string "cep"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cidade"
  end

  create_table "local_intermediarios", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "local"
    t.bigint "trajeto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trajeto_id"], name: "index_local_intermediarios_on_trajeto_id"
  end

  create_table "trajetos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "local_partida"
    t.string "local_destino"
    t.datetime "horario"
    t.integer "passageiros"
    t.integer "valor"
    t.text "observacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "identificacao_login_id"
  end

  add_foreign_key "local_intermediarios", "trajetos"
end
