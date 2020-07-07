class AddCreatorIdToTrailheads < ActiveRecord::Migration[6.0]
  def change
    add_column :trailheads, :creator_id, :integer
  end
end
