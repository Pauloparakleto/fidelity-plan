require "rails_helper"

RSpec.describe Item, type: :model do
  context "when create invalid" do
    it "has invalid quantity" do
      food = create(:food)
      order = described_class.create(food_id: food.id, quantity: -2)
      expect(order.errors.full_messages[1]).to eq("Quantity must be greater than or equal to 1")
    end
  end
end
