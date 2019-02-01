class DropEnderecosTable < ActiveRecord::Migration
  def up
    drop_table :enderecos 
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
