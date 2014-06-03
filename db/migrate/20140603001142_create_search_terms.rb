class CreateSearchTerms < ActiveRecord::Migration
  def change
    create_table :search_terms do |t|
      t.string :searchtype
      t.string :artist
      t.string :album
      t.string :track
      t.string :lyrics
      t.string :meta
      t.string :all
      t.string :limit
      t.string :output

      t.timestamps
    end
  end
end
