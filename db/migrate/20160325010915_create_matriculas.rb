class CreateMatriculas < ActiveRecord::Migration
  def change
    create_table :matriculas do |t|
      t.string :codigo_matricula, limit: 40
      t.string :status_matricula, limit: 20
      t.datetime :data_inicio_matricula
      t.string :codigo_contrato, limit: 40
      t.date :data_inicio_contrato
      t.date :data_fim_contrato
      t.references :turma, index: true, foreign_key: true
      t.references :aluno, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
