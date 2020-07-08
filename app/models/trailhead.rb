class Trailhead < ApplicationRecord
    has_many :hikes
    has_many :check_ins
    has_many :users, through: :check_ins

    validates :name, presence: true, uniqueness: true
    validates :location, presence: true, uniqueness: true
    validates :amenities, presence: true
    validates :fees, presence: true

    def self.search(query)
        self.where("name LIKE ?", "%#{query}%")
    end

    def self.most_check_ins
        joins(:check_ins).group("trailheads.id").order("COUNT(*) DESC").select("trailheads.*").limit(1)
    end

end
