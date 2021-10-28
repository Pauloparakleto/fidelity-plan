require "rails_helper"

RSpec.describe "Users", type: :request do
  let!(:admin) { create(:admin) }
  let!(:user) { create(:user) }

  describe "GET /index" do
    it "does not get index" do
      get "/users/index"
      expect(response).to have_http_status(:found)
    end

    it "does not get admin invitation new" do
      get "/admins/invitation/new"
      expect(response).to have_http_status(:found)
    end

    it "does not get admin invitation new logged user" do
      sign_in user
      get "/admins/invitation/new"
      expect(response).to have_http_status(:found)
    end

    it "gets index" do
      sign_in admin
      get "/users/index"
      expect(response).to have_http_status(:ok)
    end

    it "gets admin invitation new" do
      sign_in admin
      get "/admins/invitation/new"
      expect(response).to have_http_status(:ok)
    end
  end
end
