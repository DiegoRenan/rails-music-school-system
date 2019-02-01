class CreateFuncionarios < ActiveRecord::Migration
  def change
    create_table :funcionarios do |t|
      t.string :cpf, limit: 20
      t.string :rg, limit: 20
      t.string :nome, limit: 80
      t.string :telefone, limit: 20
      t.string :celular, limit: 20
      t.string :celular_op, limit: 20
      t.string :email, limit: 40
      t.string :cargo, limit: 40
      t.references :instituicao, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
