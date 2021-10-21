FactoryBot.define do
  factory :admin do
    name { Faker::Name.first_name }
    email { Faker::Internet.email }
  end
end
