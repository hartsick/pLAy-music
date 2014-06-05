class CreateJoinTableStopsHotspots < ActiveRecord::Migration
  def change
    create_join_table :stops, :hotspots do |t|
      t.index [:stop_id, :hotspot_id]
      t.index [:hotspot_id, :stop_id]
    end
  end
end
