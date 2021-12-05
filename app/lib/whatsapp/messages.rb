module Whatsapp
  class Messages

    def self.bot
      response = Twilio::TwiML::MessagingResponse.new
      response.message do |message|
        message.body("I only know about dogs or cats, sorry!")
      end
      response
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
  end
end
