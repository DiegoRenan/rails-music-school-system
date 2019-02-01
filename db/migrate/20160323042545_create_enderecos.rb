class CreateEnderecos < ActiveRecord::Migration
  def change
    create_table :enderecos do |t|
      t.string :endereco, limit: 80
      t.string :bairro, limit: 80
      t.string :cidade, limit: 80
      t.string :uf, limit: 20
      t.string :cep, limit: 20
      t.string :logradouro, limit: 80

      t.timestamps null: false
    end
  end
end
