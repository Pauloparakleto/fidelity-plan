require "rails_helper"

RSpec.describe "menu", type: :request do
  it "gets menu" do
    food_image = fixture_file_upload("menu_food.jpeg")
    create(:menu, food_image: food_image)
    get menu_path
    expect(response).to be_successful
  end
end


