class CreateFuncionariosTurmas < ActiveRecord::Migration
  def change
    create_table :funcionarios_turmas do |t|
      t.string :status
      t.references :funcionario, index: true, foreign_key: true
      t.references :turma, index: true, foreign_key: true
    end
  end
end
