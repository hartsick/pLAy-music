class AddColumnHasGeneratedPlaylist < ActiveRecord::Migration
  def change
  	add_column :routes, :has_generated_playlist, :boolean, :default => false
  end
end
