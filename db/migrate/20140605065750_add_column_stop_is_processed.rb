class AddColumnStopIsProcessed < ActiveRecord::Migration
  def change
  	add_column :stops, :is_processed, :boolean, :default => false
  end
end
