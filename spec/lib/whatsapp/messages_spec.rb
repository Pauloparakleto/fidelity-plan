require "rails_helper"

RSpec.describe Whatsapp::Messages do
  it "has one way message" do
    response = described_class.one_way_message
    expect(response.body).to eq("Aqui é do Godzilla lanches!")
  end

  it "has response traditional menu" do
    food_image = fixture_file_upload("menu_food.jpeg")
    menu = create(:menu)
    menu.food_image.attach(food_image)
    response = described_class.new.bot

    expect(response.to_s.include?("Esse é o nosso cardápio tradicional...")).to eq(true)
  end

  it "has response menu_food media" do
    food_image = fixture_file_upload("menu_food.jpeg")
    menu = create(:menu)
    menu.food_image.attach(food_image)
    response = described_class.new.bot

    expect(response.to_s.include?("menu_food.jpeg")).to eq(true)
  end
end
