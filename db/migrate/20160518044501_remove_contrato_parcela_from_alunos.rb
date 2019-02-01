class RemoveContratoParcelaFromAlunos < ActiveRecord::Migration
  def change
    remove_column :alunos, :numero_parcelas, :integer
    remove_column :alunos, :status_contrato, :string
  end
end
