FactoryBot.define do
  factory :user do
    name { "MyString" }
    email { "example@email" }
    password { "batatinha" }
    credit_wallet { 1 }
    is_admin { false }
    trait :admin do
      is_admin { true }
    end
  end
end
