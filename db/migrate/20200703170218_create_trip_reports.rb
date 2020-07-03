class CreateTripReports < ActiveRecord::Migration[6.0]
  def change
    create_table :trip_reports do |t|
      t.integer :user_id
      t.integer :hike_id
      t.datetime :trip_report_date
      t.text :content
      t.integer :rating

      t.timestamps
    end
  end
end
