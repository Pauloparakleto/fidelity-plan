require "rails_helper"

RSpec.describe Food, type: :model do
  context "when create" do
    it "is valid" do
      food = create(:food)
      expect(food).to be_valid
    end

    it "has name" do
      food = create(:food)
      expect(food.name).to eq("x-bacon")
    end

    it "has description" do
      food = create(:food)
      expect(food.description).to eq("salad, tomato")
    end

    it "has price" do
      food = create(:food)
      expect(food.price).to eq(12.00)
    end
  end

  context "when update" do
    it "is valid" do
      food = create(:food)
      food.update(name: "x-salad")
      expect(food).to be_valid
    end

    it "has name" do
      food = create(:food)
      food.update(name: "x-salad")
      expect(food.name).to eq("x-salad")
    end

    it "has description" do
      food = create(:food)
      food.update(description: "salad")
      expect(food.description).to eq("salad")
    end

    it "has price" do
      food = create(:food)
      food.update(price: 13.00)
      expect(food.price).to eq(13.00)
    end
  end
end
