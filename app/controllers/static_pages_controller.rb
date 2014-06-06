class StaticPagesController < ApplicationController
  def home
    @routes = Route.all
   # @route_start = Stop.find(Route.first.route_stops.order("stop_sequence ASC").map(&:stop_id))

#    @route_end = Route.first.route_stops.order("stop_sequence ASC").last.stop

  # @route1 = Route.find(params[:id])
  # @route_end = route1.route_stops.last.stop


  end
end

