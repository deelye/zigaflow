class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.string :date
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
