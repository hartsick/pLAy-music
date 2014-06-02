class Stop < ActiveRecord::Base
	has_many :route_stops
	has_many :routes, through: :route_stops

	validates_presence_of :stop_id, :stop_name, :stop_lat, :stop_lon
	validates_uniqueness_of :stop_id
end
