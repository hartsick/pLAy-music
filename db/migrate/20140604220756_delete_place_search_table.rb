class DeletePlaceSearchTable < ActiveRecord::Migration
  def change
  	drop_table :place_searches
  end
end
