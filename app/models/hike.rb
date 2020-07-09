class Hike < ApplicationRecord
    belongs_to :user
    belongs_to :trailhead
    has_many :trip_reports

    validates :name, presence: true, uniqueness: true
    validates :difficulty, inclusion: { in: %w(Easy Moderate Difficult), message: "%{value} is not a valid difficulty selection." }
    validates :distance, presence: true
    validates :elevation_gain, presence: true
    validates :hike_type, presence: true
    validates :description, length: { in: 50..20000}

    def self.search(query)
        self.where("name LIKE ?", "%#{query}%")
    end
    
    def self.family_friendly
        where(family_friendly: true)
    end

    def self.dog_friendly
        where(dog_friendly: true)
    end

    def self.beaches
        where(beaches: true)
    end

    def self.wildflowers
        where(wildflowers: true)
    end

    def self.mountains
        where(mountains: true)
    end

    def self.waterfalls
        where(waterfalls: true)
    end
    
    def boolean_display
        display_text = nil
        arr = []

        if self.waterfalls == true
            arr << "Waterfalls"
        end

        if self.wildflowers == true
            arr << "Wildflowers"
        end

        if self.mountains == true
            arr << "Mountains"
        end

        if self.beaches == true
            arr << "Beaches"
        end

        if self.family_friendly == true
            arr << "Family-friendly"
        end

        if self.dog_friendly == true
            arr << "Dog-friendly"
        end

        unless arr.empty?
            display_text = arr.join(", ")
        end

        display_text
    end

end
