class CreateJoinTableHotspotsSongs < ActiveRecord::Migration
  def change
    create_join_table :hotspots, :songs do |t|
      t.index [:hotspot_id, :song_id]
      t.index [:song_id, :hotspot_id]
    end
  end
end
