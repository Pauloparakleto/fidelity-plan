require "rails_helper"

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "does not get index" do
      get "/users/index"
      expect(response).to have_http_status(:ok)
    end
  end
end
