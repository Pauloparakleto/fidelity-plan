require "rails_helper"

RSpec.describe "whatsapp", type: :request do
  let!(:params) {
    { "SmsMessageSid" => "SM0424861ae52314da930b962ac859d87d",
      "NumMedia" => "0",
      "ProfileName" => "Paulo Felipe",
      "SmsSid" => "SM0424861ae52314da930b962ac859d87d",
      "WaId" => "559192736624",
      "SmsStatus" => "received",
      "Body" => "F",
      "To" => "whatsapp:+14155238886",
      "NumSegments" => "1",
      "MessageSid" => "SM0424861ae52314da930b962ac859d87d",
      "AccountSid" => "ACf9adc904b3231e0d15d52b52a7862648",
      "From" => "whatsapp:+559192736624",
      "ApiVersion" => "2010-04-01" }
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
