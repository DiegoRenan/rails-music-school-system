class RemoveCodigosFromMatriculas < ActiveRecord::Migration
  def change
    remove_column :matriculas, :codigo_matricula, :string
    remove_column :matriculas, :codigo_contrato, :string
  end
end
