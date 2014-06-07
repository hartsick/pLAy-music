class Route < ActiveRecord::Base
	has_many :route_stops
	has_many :stops, through: :route_stops
	has_and_belongs_to_many :playlists
	has_and_belongs_to_many :users

	validates_presence_of :route_id, :route_short_name
	validates_uniqueness_of :route_id

	def friendly_name
		self.route_stops.first.stop.stop_name + " -> " + self.route_stops.last.stop.stop_name #questionable order
	end
end
