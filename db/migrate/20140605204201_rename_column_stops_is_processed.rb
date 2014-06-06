class RenameColumnStopsIsProcessed < ActiveRecord::Migration
  def change
  	rename_column :stops, :is_processed, :has_generated_hotspot
  end
end
