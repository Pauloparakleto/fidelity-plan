require "rails_helper"

RSpec.describe UserBadge do
  context "when create" do
    it "has badge uno" do
      user = create(:user)
      result = described_class.new(user).call
      expect(result.badge.uno?).to eq(true)
    end
  end
end
