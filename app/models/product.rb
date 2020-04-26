class Product < ApplicationRecord
  has_many :items

  validates :code, uniqueness: true, presence: true
  validates :description, uniqueness: true, presence: true
  validates :gross, presence: true
end
