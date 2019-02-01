class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :login, limit: 40
      t.string :senha, limit: 20
      t.string :nivel, limit: 10
      t.references :funcionario, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
