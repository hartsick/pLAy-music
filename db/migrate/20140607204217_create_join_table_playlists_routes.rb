class CreateJoinTablePlaylistsRoutes < ActiveRecord::Migration
  def change
    create_join_table :playlists, :routes do |t|
      # t.index [:playlist_id, :route_id]
      t.index [:route_id, :playlist_id]
    end
  end
end
