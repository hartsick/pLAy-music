class RoutesController < ApplicationController

  respond_to :json, :html
  def index
  	@routes = Route.all
    respond_with @routes
  end

  def show
  	@route = Route.find(params[:id])
    respond_with @route
  end

end
