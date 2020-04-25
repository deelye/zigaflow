class Product < ApplicationRecord
  has_many :invoices

  validates :name, uniqueness: true, presence: true
  validates :description, uniqueness: true, presence: true
  validates :gross, presence: true
end
