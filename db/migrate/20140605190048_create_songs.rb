class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :lfid
      t.integer :amg
      t.boolean :instrumental
      t.boolean :viewable
      t.boolean :has_lrc
      t.string :title
      t.string :artist_name
      t.string :snippet
      t.string :context
      t.datetime :last_update
      t.float :score

      t.timestamps
    end
  end
end
