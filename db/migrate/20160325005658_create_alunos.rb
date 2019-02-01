class CreateAlunos < ActiveRecord::Migration
  def change
    create_table :alunos do |t|
      t.string :cpf, limit: 20
      t.string :rg, limit: 20
      t.string :nome, limit: 80
      t.date :data_nascimento
      t.string :estado_civil, limit: 20
      t.string :sexo, limit: 20
      t.string :telefone, limit: 20
      t.string :celular, limit: 20
      t.string :email, limit: 40
      t.string :profissao, limit: 40
      t.string :nome_pai, limit: 80
      t.string :nome_mae, limit: 80
      t.text :observacao, limit: 200
      t.string :parentesco_responsavel, limit: 20
      t.references :responsavel, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
