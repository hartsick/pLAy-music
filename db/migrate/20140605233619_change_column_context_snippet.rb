class ChangeColumnContextSnippet < ActiveRecord::Migration
  def change
  	change_column :songs, :context, :text
  	change_column :songs, :snippet, :text
  end
end
