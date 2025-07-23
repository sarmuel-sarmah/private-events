class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  validates :title, :desc, :date, :location, presence: true
end
