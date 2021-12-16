require "rails_helper"

RSpec.describe "menu", type: :request do
  it "gets menu" do
    food_image = fixture_file_upload("menu_food.jpeg")
    create(:menu, food_image: food_image)
    get menu_path
    expect(response).to be_successful
  end

  it "gets menu empty" do
    get menu_path
    expect(response).to be_successful
  end

  it "PATCH image" do
    food_image = fixture_file_upload("menu_food.jpeg")
    menu = create(:menu)
    patch update_food_image_path(menu.id), params: { menu: { food_image: food_image } }
    expect(menu.reload.food_image).to be_attached
  end
end
