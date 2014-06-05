class CreateHotspots < ActiveRecord::Migration
  def change
    create_table :hotspots do |t|
      t.float :hot_lat
      t.float :hot_lng
      t.string :name
      t.string :gp_id
      t.string :types

      t.timestamps
    end
  end
end
