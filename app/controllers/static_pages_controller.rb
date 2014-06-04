class StaticPagesController < ApplicationController
  def home
    @routes = Route.all
#    @route_start = Stop.find(Route.first.route_stops.order("stop_sequence ASC").map(&:stop_id))

#    @route_end = Route.first.route_stops.order("stop_sequence ASC").last.stop
	
	@routefirst_lat = Route.first.stops.first.stop_lat
	@routefirst_lng = Route.first.stops.first.stop_lon
	@routelast_lat = Route.first.stops.last.stop_lat
	@routelast_lng = Route.first.stops.last.stop_lon

	

  end
end

