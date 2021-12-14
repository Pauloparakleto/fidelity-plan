require "rails_helper"

RSpec.describe Drink, type: :model do
  let!(:price) { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
  let!(:drink) { create(:drink, price: price) }

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price) }
  end

  context "when create" do
    it "is valid" do
      expect(drink).to be_valid
    end

    it "has name" do
      expect(drink.name).to eq("suco de abacaxi")
    end

    it "has price" do
      expect(drink.price).to eq(price)
    end
  end

  context "when update" do
    it "is valid" do
      drink.update(name: "suco de goiaba")
      expect(drink).to be_valid
    end

    it "has name" do
      drink.update(name: "suco de abacaxi")
      expect(drink.name).to eq("suco de abacaxi")
    end

    it "has price" do
      drink.update(price: 4.00)
      expect(drink.price).to eq(4.00)
    end
  end
end
