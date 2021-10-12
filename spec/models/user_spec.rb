require "rails_helper"

RSpec.describe User, type: :model do
  context "when create" do
    it "is valid" do
      user = described_class.create(email: "alparakleto@gmail.com", password: "123456")
      expect(user).to be_valid
    end

    it "is invalid password nil" do
      user = described_class.create(email: "alparakleto@gmail.com", password: nil)
      expect(user).not_to be_valid
    end

    it "is invalid password too short" do
      user = described_class.create(email: "alparakleto@gmail.com", password: "1234")
      expect(user).not_to be_valid
    end
  end
end
