class Room < ApplicationRecord
    has_many :messages
    
    before_create :set_opentok_id

    private

    def set_opentok_id
        opentok = OpenTok::OpenTok.new(ENV['VANAGE_API_KEY'], ENV['VANAGE_API_SECRET'])
        session = opentok.create_session
        self.vanage_session_id = session.session_id
    end
end
