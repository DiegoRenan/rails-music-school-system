class CreateTurmas < ActiveRecord::Migration
  def change
    create_table :turmas do |t|
      t.string :nome, limit: 80
      t.date :inicio
      t.date :termino
      t.time :hora_inicio
      t.time :hora_fim
      t.string :dia, limit: 40
      t.references :instituicao, index: true, foreign_key: true
      t.references :curso, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
