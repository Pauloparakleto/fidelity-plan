FactoryBot.define do
  factory :admin do
    email { Faker::Internet.email }
    password { "123456" }
  end
end
