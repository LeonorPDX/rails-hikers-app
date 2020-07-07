class TripReport < ApplicationRecord
    belongs_to :user
    belongs_to :hike

    validates :content, length: { in: 10..3000 }
    validates :trip_report_date, presence: true

    def format_date
        self.trip_report_date.strftime("%B %d, %Y")
    end
end
