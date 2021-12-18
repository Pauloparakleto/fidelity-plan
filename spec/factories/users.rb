FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "123456" }
    address { "av. joão paulo, n 45" }
  end
end
