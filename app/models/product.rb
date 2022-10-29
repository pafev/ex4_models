class Product < ApplicationRecord
  has_many :purchases, dependent: :destroy
  belongs_to :brand
  belongs_to :category
end
