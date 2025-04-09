FactoryBot.define do
  factory :dynamic do
    name { Faker::Educator.course_name }
    description { Faker::Lorem.paragraph }
  end
end
