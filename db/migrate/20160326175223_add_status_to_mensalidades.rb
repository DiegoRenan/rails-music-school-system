class AddStatusToMensalidades < ActiveRecord::Migration
  def change
    add_column :mensalidades, :status, :string, limit: 20
  end
end
