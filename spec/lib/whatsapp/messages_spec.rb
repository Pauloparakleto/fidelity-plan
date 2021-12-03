require "rails_helper"

RSpec.describe Whatsapp::Messages do
  it "has one way message" do
    response = described_class.one_way_message
    expect(response.body).to eq("Aqui é do Godzilla lanches!")
  end
end
