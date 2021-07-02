class Room < ApplicationRecord
    before_create :set_opentok_id

    validates_presence_of :name

    private

    def set_opentok_id
        opentok = OpenTok::OpenTok.new(ENV['VANAGE_API_KEY'], ENV['VANAGE_API_SECRET'])
        session = opentok.create_session
        self.vanage_session_id = session.session_id
    end
end
