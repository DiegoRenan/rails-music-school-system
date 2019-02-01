class AddContratoParcelasToAlunos < ActiveRecord::Migration
  def change
    add_column :alunos, :status_contrato, :string
    add_column :alunos, :numero_parcelas, :integer
  end
end
