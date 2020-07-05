class CheckIn < ApplicationRecord
    belongs_to :user
    belongs_to :trailhead

    validates :check_in_date, presence: true, uniqueness: { scope: [:trailhead_id, :user_id], message: "can only be used once per day, per user, per trailhead." }

    def format_date
        self.check_in_date.strftime("%B %d, %Y")
    end
end
