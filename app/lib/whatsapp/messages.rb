module Whatsapp
  class Messages
    def self.one_way_message
      account_sid = ENV['TWILIO_ACCOUNT_ID']
      auth_token = ENV['TWILIO_AUTH_TOKEN']
      @client = Twilio::REST::Client.new(account_sid, auth_token)

      @client.messages.create(
        body: 'Aqui é do Godzilla lanches!',
        from: 'whatsapp:+14155238886',
        to: 'whatsapp:+559192736624'
      )
    end
  end
end
