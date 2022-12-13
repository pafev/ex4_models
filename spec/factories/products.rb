FactoryBot.define do
  factory :product do
    name { "MyString" }
    description { "MyString" }
    price { 1 }
    stock_quantity { 1 }
    brand { association(:brand) }
    category { association(:category) }
  end
end
