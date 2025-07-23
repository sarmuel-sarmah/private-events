class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :event_attendings, foreign_key: :event_attendee_id
  has_many :attendees, through: :event_attendings, source: :event_attendee
  validates :title, :desc, :date, :location, presence: true
end
