class CreateJoinTableStopsSongs < ActiveRecord::Migration
  def change
    create_join_table :stops, :songs do |t|
      t.index [:stop_id, :song_id]
      t.index [:song_id, :stop_id]
    end
  end
end
