FactoryBot.define do
  factory :review do
    dynamic { nil }
    comment { Faker::Lorem.sentence }
    rating { rand(1..5) }
  end
end
