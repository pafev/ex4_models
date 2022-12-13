FactoryBot.define do
  factory :purchase do
    cart { association(:cart) }
    product { association(:product) }
  end
end
