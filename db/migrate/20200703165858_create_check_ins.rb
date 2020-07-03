class CreateCheckIns < ActiveRecord::Migration[6.0]
  def change
    create_table :check_ins do |t|
      t.datetime :check_in_date
      t.integer :user_id
      t.integer :trailhead_id

      t.timestamps
    end
  end
end
