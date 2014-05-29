class CreateRouteRaws < ActiveRecord::Migration
  def change
    create_table :route_raws do |t|
      t.string :route_id
      t.string :route_short_name
      t.string :route_long_name
      t.string :route_desc
      t.string :route_desc
      t.integer :route_type
      t.string :route_color
      t.string :route_text_color
      t.string :route_url

      t.timestamps
    end
  end
end
