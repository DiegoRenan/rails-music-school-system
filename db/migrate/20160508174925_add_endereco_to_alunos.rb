class AddEnderecoToAlunos < ActiveRecord::Migration
  def change
    add_column :alunos, :endereco, :string
    add_column :alunos, :numero, :integer
    add_column :alunos, :bairro, :string
    add_column :alunos, :cidade, :string
    add_column :alunos, :uf, :string
    add_column :alunos, :cep, :string
  end
end
