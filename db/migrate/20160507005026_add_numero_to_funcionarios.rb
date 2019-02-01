class AddNumeroToFuncionarios < ActiveRecord::Migration
  def change
    add_column :funcionarios, :numero, :integer
  end
end
