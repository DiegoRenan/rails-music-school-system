class CreateSalasTurmas < ActiveRecord::Migration
  def change
    create_table :salas_turmas do |t|
      t.string :status
      t.references :sala, index: true, foreign_key: true
      t.references :turma, index: true, foreign_key: true
    end
  end
end
