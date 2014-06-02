class RouteStop < ActiveRecord::Base
	belongs_to :route
	belongs_to :stop

	validates_presence_of :route, :stop, :stop_sequence
end
