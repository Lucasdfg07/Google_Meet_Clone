class RoomsController < ApplicationController
    before_action :set_room, only: [:show]

    def create
        @room = Room.new

        if @room.save
            redirect_to "/rooms/#{@room.vanage_session_id}", notice: 'Sala criada com sucesso.'
        else
            redirect_to root_path, alert: 'Erro ao criar sala.'
        end
    end

    def show
        opentok = OpenTok::OpenTok.new(ENV['VANAGE_API_KEY'], ENV['VANAGE_API_SECRET'])
        @vanage_session_id = @room.vanage_session_id
        @token = opentok.generate_token(@vanage_session_id, {name: params[:user_name]})
    end

    def search
        room = Room.find_or_create_by(vanage_session_id: params[:room_url])
        
        if room.present?
            redirect_to "/rooms/#{room.vanage_session_id}"
        else
            redirect_to root_path, alert: 'Nenhuma sala encontrada.'
        end
    end

    private 

    def set_room
        @room = Room.find(params[:id])
    end
end
