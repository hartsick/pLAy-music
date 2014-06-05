class AddColumnHotSpotSource < ActiveRecord::Migration
  def change
  	add_column :hotspots, :source, :string
  end
end
