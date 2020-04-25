class RenameColumnInProducts < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :name, :code
  end
end
