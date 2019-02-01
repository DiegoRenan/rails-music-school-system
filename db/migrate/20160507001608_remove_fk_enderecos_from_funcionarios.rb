class RemoveFkEnderecosFromFuncionarios < ActiveRecord::Migration
  def change
    remove_foreign_key :funcionarios, :endereco
  end
end
