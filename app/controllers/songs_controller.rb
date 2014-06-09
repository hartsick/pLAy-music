class SongsController < ApplicationController
  def index
  	@songs = Song.all
  end

  def show
  	@song = Song.find(params[:id])
  	@song.hotspots
  end
end
