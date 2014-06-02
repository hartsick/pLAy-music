class Route < ActiveRecord::Base
	has_many :route_stops
	has_many :stops, through: :route_stops

	validates_presence_of :route_id, :route_short_name
	validates_uniqueness_of :route_id
end
