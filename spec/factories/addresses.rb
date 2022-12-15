FactoryBot.define do
  factory :address do
    description { "MyText" }
    user { association(:user) }
  end
end
