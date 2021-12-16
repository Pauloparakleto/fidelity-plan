require "rails_helper"

RSpec.describe Menu, type: :model do
  let!(:image) { fixture_file_upload("menu_food.jpeg") }

  context "when create" do
    it "is valid" do
      menu = create(:menu)
      expect(menu).to be_valid
    end

    it "has image" do
      menu = create(:menu, food_image: image)
      expect(menu.food_image).to be_attached
    end

    it "has many foods" do
      food = create(:food)
      menu = create(:menu, foods: [food])
      expect(menu.foods.first).to be_valid
    end
  end
end
