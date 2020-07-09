class CheckIn < ApplicationRecord
    belongs_to :user
    belongs_to :trailhead

    validates :check_in_date, presence: true, uniqueness: { scope: [:trailhead_id, :user_id] }

end
