class Item < ApplicationRecord
  belongs_to :invoice
  belongs_to :product

  validates :quantity, numericality: { only_integer: true }, presence: true
end
