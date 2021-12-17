require "rails_helper"

RSpec.describe Whatsapp::Messages do
  let!(:params) {
    { "ProfileName" => "Paulo Felipe",
      "WaId" => "559192736624",
      "To" => "whatsapp:+14155238886",
      "From" => "whatsapp:+559192736624",
      "Body" => "olá" }
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

  context "with address" do
    let!(:params_with_address) {
      { "ProfileName" => "Paulo Felipe",
        "WaId" => "559192736624",
        "Body" => "av. joao paulo n 45",
        "To" => "whatsapp:+14155238886",
        "From" => "whatsapp:+559192736624" }
    }

    let!(:params_without_address) {
      { "ProfileName" => "Paulo Felipe",
        "WaId" => "559192736624",
        "Body" => "olá, quero fazer meu pedido",
        "To" => "whatsapp:+14155238886",
        "From" => "whatsapp:+559192736624" }
    }

    it "saves user address" do
      food_image = fixture_file_upload("menu_food.jpeg")
      menu = create(:menu)
      menu.food_image.attach(food_image)
      described_class.new(params_with_address).bot

      expect(User.last.reload.address).to eq("av. joao paulo n 45")
    end

    it "does not save user address" do
      food_image = fixture_file_upload("menu_food.jpeg")
      menu = create(:menu)
      menu.food_image.attach(food_image)
      described_class.new(params_without_address).bot

      expect(User.last.address).to eq(nil)
    end
  end
end
