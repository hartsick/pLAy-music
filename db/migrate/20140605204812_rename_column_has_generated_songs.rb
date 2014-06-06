class RenameColumnHasGeneratedSongs < ActiveRecord::Migration
  def change
  	rename_column :hotspots, :has_generated_songs, :has_generated_song
  end
end
