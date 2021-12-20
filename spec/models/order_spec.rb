require "rails_helper"

RSpec.describe Order, type: :model do
  let!(:food) { create(:food) }
  let!(:drink) { create(:drink) }
  let!(:order) {
    described_class.create(items_attributes: [
                             { food_id: food.id, price: 13.23, quantity: 2 },
                             { drink_id: drink.id, price: 4.50, quantity: 3 },
                           ])
  }

  context "when create" do
    it "has two items" do
      expect(order.items.count).to eq(2)
    end

    it "has first item with price" do
      expect(order.items.first.price).to eq(13.23)
    end

    it "has first item with quantity" do
      expect(order.items.first.quantity).to eq(2)
    end

    it "has second item with price" do
      expect(order.items.second.price).to eq(4.50)
    end

    it "has second item with quantity" do
      expect(order.items.second.quantity).to eq(3)
    end
  end
end
