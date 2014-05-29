class CreateStopTimeRaws < ActiveRecord::Migration
  def change
    create_table :stop_time_raws do |t|
      t.integer :trip_id
      t.string :arrival_time
      t.string :departure_time
      t.integer :stop_id
      t.integer :stop_sequence
      t.string :stop_headsign
      t.integer :pickup_type
      t.integer :drop_off_type

      t.timestamps
    end
  end
end
