class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.string :nome, limit: 80
      t.float :valor

      t.timestamps null: false
    end
  end
end
