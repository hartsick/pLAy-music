class CreateTripRaws < ActiveRecord::Migration
  def change
    create_table :trip_raws do |t|
      t.string :route_id
      t.string :service_id
      t.integer :trip_id
      t.string :trip_headsign
      t.integer :direction_id
      t.integer :block_id

      t.timestamps
    end
  end
end
