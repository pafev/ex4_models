class User < ApplicationRecord
    has_one :cart, dependent: :destroy
    validates :name, :email, presence: :true, uniqueness: :true
    validates :password, presence: :true
end
