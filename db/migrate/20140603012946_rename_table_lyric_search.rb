class RenameTableLyricSearch < ActiveRecord::Migration
  def change
  	rename_table :search_terms, :lyric_searchs
  end
end
