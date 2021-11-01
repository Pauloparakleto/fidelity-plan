require "rails_helper"

RSpec.describe KeyCheckerHelper, type: :helper do
  it "has sendgrid api key password" do
    expect(helper).to be_sendgrid_key_present
  end
end
