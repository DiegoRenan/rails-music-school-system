class AddDiaVencimentoToMatriculas < ActiveRecord::Migration
  def change
    add_column :matriculas, :dia_vencimento, :integer
  end
end
