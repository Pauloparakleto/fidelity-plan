require "rails_helper"

RSpec.describe Badge, type: :model do
  context "when create" do
    it "has status" do
      badge = described_class.create
      expect(badge).to be_uno
    end

    it "is invalid for nil status" do
      badge = described_class.new(status: nil)

      expect(badge).not_to be_valid
    end
  end
end