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

  def show_songs
  	@route = Route.find(params[:id])
  	@songs = @route.songs.distinct

  	render 'show_songs'
  end

end
