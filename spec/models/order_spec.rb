require 'rails_helper'

RSpec.describe Order, type: :model do
  context "when create" do
    it "is valid" do
      food_menu = create(:food)
      order = described_class.create(item_attributes: { food_id: food_menu.id })
      expect(order.item).to eq(Item.last)
    end
  end
end
