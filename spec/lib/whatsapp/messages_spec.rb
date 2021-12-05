require "rails_helper"

RSpec.describe Whatsapp::Messages do
  it "has one way message" do
    response = described_class.one_way_message
    expect(response.body).to eq("Aqui é do Godzilla lanches!")
  end

  it "has response only dogs and cats" do
    response = described_class.bot
    expect(response.to_s.include?("I only know about the food menu!")).to eq(true)
  end
end
