require "rails_helper"

RSpec.describe "Users", type: :request do
  let!(:admin) { create(:admin) }

  describe "GET /index" do
    it "does not get index" do
      get "/users/index"
      expect(response).to have_http_status(:found)
    end

    it "gets index" do
      sign_in admin
      get "/users/index"
      expect(response).to have_http_status(:ok)
    end
  end
end
