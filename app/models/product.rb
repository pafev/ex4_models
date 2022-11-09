class Product < ApplicationRecord
  has_many_attached :images
  has_many :purchases, dependent: :destroy
  belongs_to :brand
  belongs_to :category
  validates :name, :price, :stock_quantity, presence: :true
  validates :name, uniqueness: :true
end
