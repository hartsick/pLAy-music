class StaticPagesController < ApplicationController
  def home
    @routes = Route.all
		# @route_start = Stop.find(Route.first.route_stops.order("stop_sequence ASC").map(&:stop_id))
		# @route_end = Route.first.route_stops.order("stop_sequence ASC").last.stop
  end
end

