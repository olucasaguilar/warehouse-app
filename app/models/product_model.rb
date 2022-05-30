class ProductModel < ApplicationRecord
  belongs_to :supplier
  validates :name, :height, :width, :depth, :weight, :sku, :supplier_id, presence: true
  validates :sku, uniqueness: true
  validates :weight, :height, :depth, :width, numericality: { greater_than: 0 }
end
