FactoryBot.define do
  factory :user do
    name { "MyString" }
    email { "MyString" }
    password { "MyString" }
    credit_wallet { 1 }
    is_admin { false }
  end
end
