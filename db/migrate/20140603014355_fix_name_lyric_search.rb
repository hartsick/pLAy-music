class FixNameLyricSearch < ActiveRecord::Migration
  def change
   	rename_table :lyric_searchs, :lyric_searches
  end
end
