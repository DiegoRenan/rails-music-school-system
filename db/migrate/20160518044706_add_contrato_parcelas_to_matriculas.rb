class AddContratoParcelasToMatriculas < ActiveRecord::Migration
  def change
    add_column :matriculas, :status_contrato, :string
    add_column :matriculas, :numero_parcelas, :integer
  end
end
