class CreateModelcons < ActiveRecord::Migration
  def change
    create_table :modelcons do |t|
      t.text :modelo
      t.string :titulo

      t.timestamps null: false
    end
  end
end
