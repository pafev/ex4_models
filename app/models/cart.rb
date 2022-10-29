class Cart < ApplicationRecord
  has_many :purchases, dependent: :destroy
  belongs_to :user
end
