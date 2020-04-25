class RemoveNetFromProduct < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :net, :float
  end
end
