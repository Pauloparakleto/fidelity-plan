require "rails_helper"

RSpec.describe "whatsapp", type: :request do
  let!(:params) {
    { "ProfileName" => "Paulo Felipe",
      "WaId" => "559192736624",
      "To" => "whatsapp:+14155238886",
      "From" => "whatsapp:+559192736624",
      "Body" => "Olá" }
  }

  it "gets one way message" do
    get api_v1_send_one_way_message_path
    expect(response).to have_http_status(:ok)
  end

  it "post message" do
    food_image = fixture_file_upload("menu_food.jpeg")
    menu = create(:menu)
    menu.food_image.attach(food_image)
    post api_v1_bot_path, params: params
    expect(response).to have_http_status(:ok)
  end
end
