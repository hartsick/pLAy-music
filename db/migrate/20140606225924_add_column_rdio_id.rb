class AddColumnRdioId < ActiveRecord::Migration
  def change
  	add_column :songs, :rdio_id, :string
  end
end
