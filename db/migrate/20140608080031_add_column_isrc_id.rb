class AddColumnIsrcId < ActiveRecord::Migration
  def change
  	add_column :songs, :isrc_id, :string
  end
end
