class CreateTrailheads < ActiveRecord::Migration[6.0]
  def change
    create_table :trailheads do |t|
      t.string :location
      t.string :amenities
      t.string :fees

      t.timestamps
    end
  end
end
