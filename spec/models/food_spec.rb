require "rails_helper"

RSpec.describe Food, type: :model do
  let!(:food) { create(:food) }

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  context "when create" do
    it "is valid" do
      expect(food).to be_valid
    end

    it "has name" do
      expect(food.name).to eq("x-bacon")
    end

    it "has description" do
      expect(food.description).to eq("salad, tomato")
    end

    it "has price" do
      expect(food.price).to eq(12.00)
    end
  end

  context "when update" do
    it "is valid" do
      food.update(name: "x-salad")
      expect(food).to be_valid
    end

    it "has name" do
      food.update(name: "x-salad")
      expect(food.name).to eq("x-salad")
    end

    it "has description" do
      food.update(description: "salad")
      expect(food.description).to eq("salad")
    end

    it "has price" do
      food.update(price: 13.00)
      expect(food.price).to eq(13.00)
    end
  end
end
