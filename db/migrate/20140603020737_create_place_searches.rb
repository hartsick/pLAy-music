class CreatePlaceSearches < ActiveRecord::Migration
  def change
    create_table :place_searches do |t|
      t.string :key
      t.string :location, :array => true
      t.string :radius
      t.string :sensor
      t.string :keyword
      t.string :language
      t.string :minprice
      t.string :maxprice
      t.string :name
      t.string :rankby
      t.string :types
      t.string :zagatselected

      t.timestamps
    end
  end
end
