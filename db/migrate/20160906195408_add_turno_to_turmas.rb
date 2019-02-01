class AddTurnoToTurmas < ActiveRecord::Migration
  def change
    add_column :turmas, :turno, :string
  end
end
