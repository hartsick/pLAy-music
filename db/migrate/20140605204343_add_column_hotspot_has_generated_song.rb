class AddColumnHotspotHasGeneratedSong < ActiveRecord::Migration
  def change
  	add_column :hotspots, :has_generated_songs, :boolean, :default => false
  end
end
