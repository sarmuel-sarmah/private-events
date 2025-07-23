class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  validates :title, :desc, :date, presence: true
end
