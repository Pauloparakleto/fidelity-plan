FactoryBot.define do
  factory :drink do
    name { "suco de abacaxi" }
    price { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
  end
end
