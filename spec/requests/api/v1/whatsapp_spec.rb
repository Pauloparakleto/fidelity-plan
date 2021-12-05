require "rails_helper"

RSpec.describe "whatsapp", type: :request do
  it "gets one way message" do
    get api_v1_send_one_way_message_path
    expect(response).to have_http_status(:ok)
  end

  it "post message" do
    post api_v1_bot_path, params: { body: "cat" }
    expect(response).to have_http_status(:ok)
  end
end
