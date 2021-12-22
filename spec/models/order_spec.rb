require "rails_helper"

RSpec.describe Order, type: :model do
  let!(:food) { create(:food) }
  let!(:drink) { create(:drink) }
  let!(:valid_attributes) {
    { items_attributes: [
      { food_id: food.id, name: food.name, price: 13.23, quantity: 2 },
      { drink_id: drink.id, name: drink.name, price: 4.50, quantity: 3 },
    ] }
  }
  let!(:order) {
    described_class.create(valid_attributes)
  }

  context "when create" do
    it "counts order" do
      expect(described_class.count).to eq(1)
    end

    it "has two items" do
      expect(order.items.count).to eq(2)
    end

    it "has first item with name" do
      expect(order.items.first.name).to eq(food.name)
    end

    it "has first item with price" do
      expect(order.items.first.price).to eq(13.23)
    end

    it "has first item with quantity" do
      expect(order.items.first.quantity).to eq(2)
    end

    it "has second item with name" do
      expect(order.items.second.name).to eq(drink.name)
    end

    it "has second item with price" do
      expect(order.items.second.price).to eq(4.50)
    end

    it "has second item with quantity" do
      expect(order.items.second.quantity).to eq(3)
    end

    it "sums 39.96" do
      expect(order.total).to eq(39.96)
    end

    it "has subtotal" do
      expect(order.items.first.subtotal).to eq(26.46)
    end
  end

  context "when update" do
    it "change the first item quantity" do
      order.update(items_attributes: [{ id: order.items.first.id, quantity: 3 }])
      expect(order.items.first.quantity).to eq(3)
    end

    it "change the second item quantity" do
      order.update(items_attributes: [{ id: order.items.second.id, quantity: 4 }])
      expect(order.items.second.quantity).to eq(4)
    end

    it "sums 53.19 including one more food" do
      order.update(items_attributes: [{ id: order.items.first.id, quantity: 3 }])
      expect(order.total).to eq(53.19)
    end

    it "sums 44.46 including on more drink" do
      order.update(items_attributes: [{ id: order.items.second.id, quantity: 4 }])
      expect(order.total).to eq(44.46)
    end
  end

  context "when destroy first item" do
    it "counts 1" do
      params = { order: { id: order.id,
                          items_attributes: [{ id: order.items.first.id, _destroy: "1" }] } }
      order.attributes = params[:order]
      order.save
      expect(order.items.length).to eq(1)
    end

    it "sums total 13.50" do
      params = { order: { id: order.id,
                          items_attributes: [{ id: order.items.first.id, _destroy: "1" }] } }
      order.attributes = params[:order]
      order.save
      expect(order.reload.total).to eq(13.50)
    end
  end

  context "when destroy second item" do
    it "counts 1" do
      params = { order: { id: order.id,
                          items_attributes: [{ id: order.items.second.id, _destroy: "1" }] } }
      order.attributes = params[:order]
      order.save
      expect(order.items.length).to eq(1)
    end

    it "sums total 13.50" do
      params = { order: { id: order.id,
                          items_attributes: [{ id: order.items.second.id, _destroy: "1" }] } }
      order.attributes = params[:order]
      order.save
      expect(order.reload.total).to eq(26.46)
    end
  end
end
