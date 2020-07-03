class Trailhead < ApplicationRecord
    has_many :hikes
    has_many :check_ins
    has_many :users, through: :check_ins
end
