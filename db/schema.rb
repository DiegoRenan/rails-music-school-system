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

ActiveRecord::Schema.define(version: 20171222211428) do

  create_table "alunos", force: :cascade do |t|
    t.string   "cpf",                    limit: 20
    t.string   "rg",                     limit: 20
    t.string   "nome",                   limit: 80
    t.date     "data_nascimento"
    t.string   "estado_civil",           limit: 20
    t.string   "sexo",                   limit: 20
    t.string   "telefone",               limit: 20
    t.string   "celular",                limit: 20
    t.string   "email",                  limit: 40
    t.string   "profissao",              limit: 40
    t.string   "nome_pai",               limit: 80
    t.string   "nome_mae",               limit: 80
    t.text     "observacao",             limit: 200
    t.string   "parentesco_responsavel", limit: 20
    t.integer  "responsavel_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "endereco"
    t.integer  "numero"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "uf"
    t.string   "cep"
  end

  add_index "alunos", ["responsavel_id"], name: "index_alunos_on_responsavel_id"

  create_table "contratos", force: :cascade do |t|
    t.text     "contrato"
    t.date     "data_fim"
    t.date     "data_inicio"
    t.integer  "numero_parcelas"
    t.string   "status"
    t.integer  "matricula_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "contratos", ["matricula_id"], name: "index_contratos_on_matricula_id"

  create_table "cursos", force: :cascade do |t|
    t.string   "nome",       limit: 80
    t.float    "valor"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "funcionarios", force: :cascade do |t|
    t.string   "cpf",            limit: 20
    t.string   "rg",             limit: 20
    t.string   "nome",           limit: 80
    t.string   "telefone",       limit: 20
    t.string   "celular",        limit: 20
    t.string   "celular_op",     limit: 20
    t.string   "email",          limit: 40
    t.string   "cargo",          limit: 40
    t.integer  "instituicao_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "endereco_id_id"
    t.string   "endereco",       limit: 80
    t.string   "bairro",         limit: 80
    t.string   "cidade",         limit: 80
    t.string   "uf",             limit: 20
    t.string   "cep",            limit: 20
    t.string   "logradouro",     limit: 80
    t.integer  "numero"
  end

  add_index "funcionarios", ["endereco_id_id"], name: "index_funcionarios_on_endereco_id_id"
  add_index "funcionarios", ["instituicao_id"], name: "index_funcionarios_on_instituicao_id"

  create_table "funcionarios_turmas", force: :cascade do |t|
    t.string  "status"
    t.integer "funcionario_id"
    t.integer "turma_id"
  end

  add_index "funcionarios_turmas", ["funcionario_id"], name: "index_funcionarios_turmas_on_funcionario_id"
  add_index "funcionarios_turmas", ["turma_id"], name: "index_funcionarios_turmas_on_turma_id"

  create_table "instituicaos", force: :cascade do |t|
    t.string   "cnpj",          limit: 20
    t.string   "insc_estadual", limit: 20
    t.string   "razao_social",  limit: 80
    t.string   "nome_fantasia", limit: 80
    t.string   "endereco",      limit: 100
    t.string   "telefone",      limit: 20
    t.string   "email",         limit: 40
    t.string   "responsavel",   limit: 40
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "matriculas", force: :cascade do |t|
    t.string   "status_matricula",      limit: 20
    t.datetime "data_inicio_matricula"
    t.date     "data_inicio_contrato"
    t.date     "data_fim_contrato"
    t.integer  "turma_id"
    t.integer  "aluno_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "status_contrato"
    t.integer  "numero_parcelas"
    t.integer  "dia_vencimento"
  end

  add_index "matriculas", ["aluno_id"], name: "index_matriculas_on_aluno_id"
  add_index "matriculas", ["turma_id"], name: "index_matriculas_on_turma_id"

  create_table "mensalidades", force: :cascade do |t|
    t.string   "codigo",          limit: 40
    t.date     "data_emissao"
    t.date     "data_vencimento"
    t.string   "numero",          limit: 20
    t.float    "valor"
    t.float    "desconto"
    t.float    "valor_desconto"
    t.float    "juros"
    t.float    "valor_pago"
    t.integer  "matricula_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "status",          limit: 20
  end

  add_index "mensalidades", ["matricula_id"], name: "index_mensalidades_on_matricula_id"

  create_table "modelcons", force: :cascade do |t|
    t.text     "modelo"
    t.string   "titulo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responsavels", force: :cascade do |t|
    t.string   "cpf"
    t.string   "rg"
    t.string   "nome"
    t.date     "data_nascimento"
    t.string   "estado_civil"
    t.string   "telefone"
    t.string   "celular"
    t.string   "email"
    t.string   "profissao"
    t.string   "endereco"
    t.string   "numero"
    t.string   "bairro"
    t.string   "cep"
    t.string   "cidade"
    t.string   "uf"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "salas", force: :cascade do |t|
    t.string   "nome",       limit: 40
    t.string   "numero",     limit: 20
    t.integer  "limite"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "salas_turmas", force: :cascade do |t|
    t.string  "status"
    t.integer "sala_id"
    t.integer "turma_id"
  end

  add_index "salas_turmas", ["sala_id"], name: "index_salas_turmas_on_sala_id"
  add_index "salas_turmas", ["turma_id"], name: "index_salas_turmas_on_turma_id"

  create_table "turmas", force: :cascade do |t|
    t.string   "nome",           limit: 80
    t.date     "inicio"
    t.date     "termino"
    t.time     "hora_inicio"
    t.time     "hora_fim"
    t.string   "dia",            limit: 40
    t.integer  "instituicao_id"
    t.integer  "curso_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "turno"
  end

  add_index "turmas", ["curso_id"], name: "index_turmas_on_curso_id"
  add_index "turmas", ["instituicao_id"], name: "index_turmas_on_instituicao_id"

  create_table "usuarios", force: :cascade do |t|
    t.string   "login",           limit: 40
    t.string   "nivel",           limit: 10
    t.integer  "funcionario_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "password_digest"
  end

  add_index "usuarios", ["funcionario_id"], name: "index_usuarios_on_funcionario_id"

end
