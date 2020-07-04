class Trailhead < ApplicationRecord
    has_many :hikes
    has_many :check_ins
    has_many :users, through: :check_ins

    validates :name, presence: true, uniqueness: true
    validates :location, presence: true, uniqueness: true
    validates :amenities, presence: true
    validates :fees, presence: true

end
