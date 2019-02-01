class AddEnderecoRefToFuncionarios < ActiveRecord::Migration
  def change
    add_reference :funcionarios, :endereco_id, index: true, foreign_key: true
  end
end
