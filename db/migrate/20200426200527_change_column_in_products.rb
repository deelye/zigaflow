class ChangeColumnInProducts < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :gross, :decimal, precision: 7, scale: 2
  end
end
