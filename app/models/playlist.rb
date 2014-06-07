class Playlist < ActiveRecord::Base
	has_and_belongs_to_many :songs
	has_and_belongs_to_many :routes

	# users can follow others' playlists
	has_and_belongs_to_many :users

end
