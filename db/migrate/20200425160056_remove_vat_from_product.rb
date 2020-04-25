class RemoveVatFromProduct < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :vat, :float
  end
end
