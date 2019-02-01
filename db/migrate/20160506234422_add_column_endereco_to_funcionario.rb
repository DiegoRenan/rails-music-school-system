class AddColumnEnderecoToFuncionario < ActiveRecord::Migration
  def change
    add_column :funcionarios, :endereco, :string, limit: 80
    add_column :funcionarios, :bairro, :string, limit: 80
    add_column :funcionarios, :cidade, :string, limit: 80
    add_column :funcionarios, :uf, :string, limit: 20
    add_column :funcionarios, :cep, :string, limit: 20
    add_column :funcionarios, :logradouro, :string, limit: 80
  end
end
