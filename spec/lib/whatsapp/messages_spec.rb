require "rails_helper"

RSpec.describe Whatsapp::Messages do
  let!(:params) {
    { "ProfileName" => "Paulo Felipe",
      "WaId" => "559192736624",
      "To" => "whatsapp:+14155238886",
      "From" => "whatsapp:+559192736624",
      "ApiVersion" => "2010-04-01" }
  }

  it "saves user phone" do
    food_image = fixture_file_upload("menu_food.jpeg")
    menu = create(:menu)
    menu.food_image.attach(food_image)
    described_class.new(params).bot

    expect(User.last.phone).to eq("559192736624")
  end

  it "set email" do
    email = described_class.new(params).set_email
    expect(email).to eq("paulo_felipe_9192736624@email.com")
  end

  it "set password" do
    email = described_class.new(params).set_password
    expect(email).to eq("paulo_felipe_9192736624")
  end

  it "has one way message" do
    response = described_class.one_way_message
    expect(response.body).to eq("Aqui é do Godzilla lanches!")
  end

  it "has response traditional menu" do
    food_image = fixture_file_upload("menu_food.jpeg")
    menu = create(:menu)
    menu.food_image.attach(food_image)
    response = described_class.new(params).bot

    expect(response.to_s.include?("Esse é o nosso cardápio tradicional...")).to eq(true)
  end

  it "has response menu_food media" do
    food_image = fixture_file_upload("menu_food.jpeg")
    menu = create(:menu)
    menu.food_image.attach(food_image)
    response = described_class.new(params).bot

    expect(response.to_s.include?("menu_food.jpeg")).to eq(true)
  end
end
