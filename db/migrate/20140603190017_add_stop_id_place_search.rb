class AddStopIdPlaceSearch < ActiveRecord::Migration
  def change
  	add_column :place_searches, :stop_id, :integer
  end
end
