require "rails_helper"

RSpec.describe "badge", type: :request do
  let!(:user) { create(:user) }

  before do
    sign_in user
  end

  # TODO, check if this request should be an admin feature
  it "gets user budge" do
    get users_badges_path(user)
    expect(response).to have_http_status(:ok)
  end

  it "gets root user badge" do
    get user_root_path
    expect(response).to have_http_status(:ok)
  end
end
