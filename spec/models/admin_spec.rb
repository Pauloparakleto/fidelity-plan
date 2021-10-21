require "rails_helper"

RSpec.describe Admin, type: :model do
  context "when create" do
    it "is valid" do
      admin = described_class.create(email: Faker::Internet.email, password: "123456")
      expect(admin).to be_valid
    end

    it "is invalid password nil" do
      admin = described_class.create(email: Faker::Internet.email, password: nil)
      expect(admin).not_to be_valid
    end

    it "is invalid password too short" do
      admin = described_class.create(email: Faker::Internet.email, password: "1234")
      expect(admin).not_to be_valid
    end

    it "is invalid not unique email" do
      email = Faker::Internet.email
      error_message = "Email has already been taken"
      described_class.create(email: email, password: "123456")
      admin_second = described_class.create(email: email, password: "123456")
      expect(admin_second.errors.full_messages.first).to eq(error_message)
    end
  end

  context "when update" do
    email = Faker::Internet.email
    described_class.create(email: email, password: "123456")

    it "has email not unique message" do
      error_message = "Email has already been taken"
      admin_second = described_class.create(email: Faker::Internet.email, password: "123456")
      admin_second.update(email: email)
      expect(admin_second.errors.full_messages.first).to eq(error_message)
    end
  end
end
