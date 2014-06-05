class ChangeColumnHotspotCounterFirst < ActiveRecord::Migration
  def change
  	rename_column :hotspot_counters, :first, :index
  end
end
