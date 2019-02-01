class CreateResponsavels < ActiveRecord::Migration
  def change
    create_table :responsavels do |t|
      t.string :cpf
      t.string :rg
      t.string :nome
      t.date :data_nascimento
      t.string :estado_civil
      t.string :telefone
      t.string :celular
      t.string :email
      t.string :profissao
      t.string :endereco
      t.string :numero
      t.string :bairro
      t.string :cep
      t.string :cidade
      t.string :uf

      t.timestamps null: false
    end
  end
end
