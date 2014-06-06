class RoutesController < ApplicationController

  respond_to :json, :html
  def index
  	@routes = Route.all
    respond_with @routes
    # @hash = Route.build_markers(@routes) do |route, marker|
    # marker.lat route.latitude
    # marker.lon route.longitude
  end
  end

  def show
  	@route = Route.find(params[:id])
    respond_with @route
  end

end
