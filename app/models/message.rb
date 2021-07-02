class Message < ApplicationRecord
  belongs_to :room

  validates_presence_of :content
end
