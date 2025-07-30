class EventAttending < ApplicationRecord
  belongs_to :event_attendee, class_name: "User"
  belongs_to :event
end
