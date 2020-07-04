class Hike < ApplicationRecord
    belongs_to :user
    belongs_to :trailhead
    has_many :trip_reports

    validates :name, presence: true, uniqueness: true
    validates :difficulty, inclusion: { in: %w(Easy Moderate Difficult), message: "%{value} is not a valid difficulty selection." }
    validates :distance, presence: true
    validates :elevation_gain, presence: true
    validates :hike_type, presence: true
    validates :description, length: { in: 50..6000}

end
