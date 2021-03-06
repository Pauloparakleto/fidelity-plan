module Api
  module V1
    class WhatsappController < ApplicationController
      def send_one_way_message
        @message = ::Whatsapp::Messages.one_way_message
        render json: { message: @message.body }, status: :ok
      end

      def bot
        @response = ::Whatsapp::Messages
        render xml: @response.new(params).bot
      end
    end
  end
end
