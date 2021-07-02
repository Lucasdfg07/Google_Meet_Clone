class MessagesController < ApplicationController
    def create
        @message = Message.new(messages_params)

        if @message.save
            ActionCable.server.broadcast("chat_room_channel", @message.content, @message.user, @message.created_at.strftime("%d/%m/%Y %H:%M"))
        else
            redirect_to request.referrer, alert: 'Erro ao enviar mensagem! Tente novamente mais tarde.'
        end
    end

    private

    def messages_params
        params.require(:message).permit(:content, :room_id, :user)
    end
end
