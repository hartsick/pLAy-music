class AddColumnPlaceQuery < ActiveRecord::Migration
  def change
  	add_column :stops, :place_query, :string
  end
end
