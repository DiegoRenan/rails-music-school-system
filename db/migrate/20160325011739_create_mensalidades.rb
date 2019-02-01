class CreateMensalidades < ActiveRecord::Migration
  def change
    create_table :mensalidades do |t|
      t.string :codigo, limit: 40
      t.date :data_emissao
      t.date :data_vencimento
      t.string :numero, limit: 20
      t.float :valor
      t.float :desconto
      t.float :valor_desconto
      t.float :juros
      t.float :valor_pago
      t.references :matricula, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
