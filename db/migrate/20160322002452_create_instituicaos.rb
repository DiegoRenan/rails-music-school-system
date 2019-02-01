class CreateInstituicaos < ActiveRecord::Migration
  def change
    create_table :instituicaos do |t|
      t.string :cnpj, limit: 20
      t.string :insc_estadual, limit: 20
      t.string :razao_social, limit: 80
      t.string :nome_fantasia, limit: 80
      t.string :endereco, limit: 100
      t.string :telefone, limit: 20
      t.string :email, limit: 40
      t.string :responsavel, limit: 40

      t.timestamps null: false
    end
  end
end
