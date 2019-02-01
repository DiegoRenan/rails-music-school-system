class RemoveEnderecoBairroCidadeUfCepLogradouroFromFuncionarios < ActiveRecord::Migration
  def change
    remove_column :funcionarios, :endereco, :string
    remove_column :funcionarios, :bairro, :string
    remove_column :funcionarios, :cidade, :string
    remove_column :funcionarios, :uf, :string
    remove_column :funcionarios, :cep, :string
    remove_column :funcionarios, :logradouro, :string
  end
end
