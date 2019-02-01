class RemoveSenhaFromUsuarios < ActiveRecord::Migration
  def change
    remove_column :usuarios, :senha, :string
  end
end
