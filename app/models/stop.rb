require 'uri'

class Stop < ActiveRecord::Base
	has_many :route_stops
	has_many :routes, through: :route_stops
	has_many :place_searches

	validates_presence_of :stop_id, :stop_name, :stop_lat, :stop_lon
	validates_uniqueness_of :stop_id

	validates_format_of :place_query, :with => URI.regexp(['https'])

	def place_query
		base_url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?"
		req_fields = ["key","location","radius","sensor"]
		opt_fields = ["keyword","language","name","rankby","types"]

		# set defaults
		# req_fields["key"]
		# req_fields["location"] = "#{self.stop_lat},#{self.stop_lon}"
	end
	
end
