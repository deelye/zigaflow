class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.float :gross
      t.float :vat
      t.float :net

      t.timestamps
    end
  end
end
