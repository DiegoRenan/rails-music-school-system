class CreateContratos < ActiveRecord::Migration
  def change
    create_table :contratos do |t|
      t.text :contrato
      t.date :data_fim
      t.date :data_inicio
      t.integer :numero_parcelas
      t.string :status
      t.references :matricula, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
