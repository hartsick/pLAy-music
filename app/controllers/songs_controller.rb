class SongsController < ApplicationController
  respond_to :json, :html
  
  def index
  	@songs = Song.all
  end

  def show_hotspots
  	@song = Song.find(params[:id])
  	respond_with @song.hotspots
  end
end
