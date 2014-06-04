class PlaceSearchesController < ApplicationController
  def index
  	@place_searches = PlaceSearch.all
  end

  def show
  	@place_searches = PlaceSearch.where(stop_id: params[:id])
  end

	# before_action :create_client, only: :send_search

	# def send_search
	# end

	# protected 

	# def create_client
	# 	@client = GooglePlaces::Client.new(ENV['PLAY_GOOGLE_KEY'])
	# end
end
