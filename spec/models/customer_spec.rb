require "rails_helper"

RSpec.describe Customer, type: :model do
  context "when create" do
    it "is valid" do
      customer = described_class.create(name: "Felipe", phone: "91992736624",
                                        phone_confirmation: "91992736624",
                                        email: "alparakleto@gmail.com")
      expect(customer).to be_valid
    end

    it "is invalid nil name" do
      customer = described_class.create(name: nil, phone: "91992736624", email: "alparakleto@gmail.com")
      expect(customer).not_to be_valid
    end

    it "is invalid nil email" do
      customer = described_class.create(name: "Felipe", phone: "91992736624", email: nil)
      expect(customer).not_to be_valid
    end

    it "is invalid nil phone" do
      customer = described_class.create(name: "Felipe", phone: nil, email: "alparakleto@gmail.com")
      expect(customer).not_to be_valid
    end
  end

  context "when update" do
    it "is valid" do
      customer = described_class.create(name: "Felipe", phone: "91992736624",
                                        phone_confirmation: "91992736624",
                                        email: "alparakleto@gmail.com")
      customer.update(name: "Paulo")
      expect(customer.name).to eq("Paulo")
    end

    it "is invalid name" do
      customer = described_class.create(name: "Felipe", phone: "91992736624",
                                        phone_confirmation: "91992736624",
                                        email: "alparakleto@gmail.com")
      customer.update(name: nil)
      expect(customer).not_to be_valid
    end
  end
end
