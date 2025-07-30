class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :event_attendings, foreign_key: :event_id
  has_many :attendees, through: :event_attendings, source: :event_attendee
  validates :title, :desc, :date, :location, presence: true

  scope :upcoming, -> { where("date > ?", Time.current) }
  scope :past, -> { where("date < ?", Time.current) }

  class << self
    def upcoming
    end

    def past
      where("date < ?", Time.current)
    end
  end
end
