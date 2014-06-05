class StopsController < ApplicationController
	before_action :set_stop, only: [:show]

  def index
  	@stops = Stop.all
  end

  def show
  end

  protected
  def set_stop
  	@stop = Stop.find(params[:id])
  end

  def strong_params
  	params.require(:stop).permit(:stop_id, :stop_name, :stop_lat, :stop_lon)
  end

end
