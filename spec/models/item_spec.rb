require "rails_helper"

RSpec.describe Item, type: :model do
  context "when create valid" do
    it "has valid order item" do
      food = create(:food)
      order = Order.items.build(food_id: food.id, quantity: 2)
      order.save
      expect(order.items.first).to be_truthy
    end
  end

  context "when create invalid" do
    it "has invalid quantity" do
      food = create(:food)
      order = described_class.create(food_id: food.id, quantity: -2)
      expect(order.errors.full_messages[1]).to eq("Quantity must be greater than or equal to 1")
    end
  end
end
