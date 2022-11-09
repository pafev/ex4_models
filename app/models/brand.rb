class Brand < ApplicationRecord
    has_one_attached :logo
    has_many :products, dependent: :destroy
    validates :name, presence: :true, uniqueness: :true
end
