class Customer < ApplicationRecord
  has_many :invoices

  validates :name, uniqueness: true, presence: true
  validates :address, uniqueness: true, presence: true
  validates :email, format: { with: /\A.*@.*\.com\z/i } uniqueness: true, presence: true
end
