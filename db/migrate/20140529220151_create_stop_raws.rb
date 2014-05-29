class CreateStopRaws < ActiveRecord::Migration
  def change
    create_table :stop_raws do |t|
      t.string :stop_id
      t.string :stop_code
      t.string :stop_name
      t.string :stop_desc
      t.float :stop_lat
      t.lon :stop
      t.string :stop_url
      t.integer :location_type
      t.integer :parent_station
      t.string :tpis_name

      t.timestamps
    end
  end
end
