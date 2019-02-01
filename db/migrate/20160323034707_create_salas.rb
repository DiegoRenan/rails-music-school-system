class CreateSalas < ActiveRecord::Migration
  def change
    create_table :salas do |t|
      t.string :nome, limit: 40
      t.string :numero, limit: 20
      t.integer :limite

      t.timestamps null: false
    end
  end
end
