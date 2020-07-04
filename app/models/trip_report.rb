class TripReport < ApplicationRecord
    belongs_to :user
    belongs_to :hike

    validates :content, length: { in: 10..1000 }
    validate :trip_report_date, presence: true
    validate :rating, presence: true
end
