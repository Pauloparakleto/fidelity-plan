require 'rails_helper'

RSpec.describe Order, type: :model do
  context "when create" do
    it "is valid" do
      food_menu = create(:food)
      order = described_class.create(item_attributes: { food_id: food_menu.id })
      expect(order.item).to eq(Item.last)
    end

    it "has two items" do
      food = create(:food)
      drink = create(:drink)
      order = described_class.create(items_attributes: [{ food_id: food.id },
                                                        { drink_id: drink.id }])
      expect(order.items.count).to eq(2)
    end
  end
end
