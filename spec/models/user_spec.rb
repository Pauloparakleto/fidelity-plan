require "rails_helper"

RSpec.describe User, type: :model do
  context "with badge" do
    it "has badge status uno" do
      user = described_class.create(email: Faker::Internet.email, password: "123456")
      expect(user.badge.uno?).to eq(true)
    end
  end

  context "when create" do
    it "is valid" do
      user = described_class.create(email: Faker::Internet.email, password: "123456")
      expect(user).to be_valid
    end

    it "is invalid password nil" do
      user = described_class.create(email: Faker::Internet.email, password: nil)
      expect(user).not_to be_valid
    end

    it "is invalid password too short" do
      user = described_class.create(email: Faker::Internet.email, password: "1234")
      expect(user).not_to be_valid
    end

    it "is invalid not unique email" do
      email = Faker::Internet.email
      error_message = "Email has already been taken"
      described_class.create(email: email, password: "123456")
      user_second = described_class.create(email: email, password: "123456")
      expect(user_second.errors.full_messages.first).to eq(error_message)
    end
  end

  context "when update" do
    email = Faker::Internet.email
    described_class.create(email: email, password: "123456")

    it "has email not unique message" do
      error_message = "Email has already been taken"
      user_second = described_class.create(email: Faker::Internet.email, password: "123456")
      user_second.update(email: email)
      expect(user_second.errors.full_messages.first).to eq(error_message)
    end
  end
end
