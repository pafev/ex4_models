FactoryBot.define do
  factory :user do
    name { "MyString" }
    email { "example@email" }
    password { "123456" }
    credit_wallet { 1 }
    is_admin { false }
    trait :admin do
      is_admin { true }
    end
  end
end
