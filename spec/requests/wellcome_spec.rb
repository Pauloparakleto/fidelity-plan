require 'rails_helper'

RSpec.describe "Wellcomes", type: :request do
  describe "GET /welcome" do
    it "returns http success" do
      get "/wellcome/welcome"
      expect(response).to have_http_status(:success)
    end
  end

end