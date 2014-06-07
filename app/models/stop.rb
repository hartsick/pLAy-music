require 'uri'

class Stop < ActiveRecord::Base
	has_many :route_stops
	has_many :routes, through: :route_stops
	has_and_belongs_to_many :hotspots
	has_and_belongs_to_many :songs

	validates_presence_of :stop_id, :stop_name, :stop_lat, :stop_lon
	validates_uniqueness_of :stop_id

	def init
		self.place_query ||= generate_place_query # generate search query
	end

	# generates API call for Google Places search
	def generate_place_query
		base_url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?"
		search_params = ""

		# set required fields
		req_fields = Hash.new
		req_fields["key"] = ENV['PLAY_GOOGLE_KEY']
		req_fields["location"] = "#{self.stop_lat.to_s},#{self.stop_lon.to_s}"
		req_fields["radius"] = "200" 
		req_fields["sensor"] = "false"

		# set optional fields
		opt_fields = Hash.new
		opt_fields["rankby"] = "prominence"
		#opt_fields["keyword"] =
		#opt_fields["language"] =
		#opt_fields["name"] =
		#opt_fields["types"] =

		req_fields.each do |key, value|

			search_field = key + "=" + value

			# if not last item in hash, add an '&'
			unless key == req_fields.to_a.last[0]
				search_field += "&"
			end

			search_params << search_field
		end

		url = base_url + search_params

	end

end
