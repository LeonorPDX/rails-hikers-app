class CreateHikes < ActiveRecord::Migration[6.0]
  def change
    create_table :hikes do |t|
      t.string :name
      t.string :distance
      t.string :elevation
      t.string :type
      t.text :description

      t.boolean :waterfalls, :default => false
      t.boolean :wildflowers, :default => false
      t.boolean :mountains, :default => false
      t.boolean :beaches, :default => false
      t.boolean :family_friendly, :default => false
      t.boolean :dog_friendly, :default => false

      t.integer :user_id
      t.integer :trailhead_id

      t.timestamps
    end
  end
end
