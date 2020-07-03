class Hike < ApplicationRecord
    belongs_to :user
    belongs_to :trailhead
    has_many :trip_reports
end
