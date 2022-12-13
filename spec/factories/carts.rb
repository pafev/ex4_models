FactoryBot.define do
  factory :cart do
    total_value { 1 }
    user { association(:user) }
  end
end
