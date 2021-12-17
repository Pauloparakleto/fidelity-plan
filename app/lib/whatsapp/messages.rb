module Whatsapp
  class Messages
    def initialize(params)
      @params = params
      @response = Twilio::TwiML::MessagingResponse.new
    end

    def create_user
      User.create(email: set_email, password: set_password, phone: @params['WaId'])
    end

    def set_email
      name = @params['ProfileName'].downcase.gsub(" ", "_")
      number = @params['WaId'].delete("55")
      name.concat("_", number, "@email.com")
    end

    def set_password
      name = @params['ProfileName'].downcase.gsub(" ", "_")
      number = @params['WaId'].delete("55")
      name.concat("_", number)
    end

    def bot
      create_user
      @response.message do |message|
        message.body("Esse é o nosso cardápio tradicional...")
        message.media path_to_food_menu
      end
      @response
    end

    def self.one_way_message
      account_sid = ENV["TWILIO_ACCOUNT_ID"]
      auth_token = ENV["TWILIO_AUTH_TOKEN"]
      @client = Twilio::REST::Client.new(account_sid, auth_token)

      create_message
    end

    def self.create_message
      @client.messages.create(
        body: "Aqui é do Godzilla lanches!",
        from: "whatsapp:+14155238886",
        to: "whatsapp:+559192736624",
      )
    end

    def path_to_food_menu
      Rails.application.routes.url_helpers.rails_blob_path(Menu.first.food_image, only_path: true)
    end
  end
end
