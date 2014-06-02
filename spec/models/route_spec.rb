require 'spec_helper'

describe Route, :type => :model do
	before (:each) do
    @route = Route.create!( route_id: '1', route_short_name: 'test route', route_long_name: 'longer name', route_desc: 'route desc' )
    @route_stop1 = RouteStop.new(stop_sequence: 1)
    @route_stop2 = RouteStop.new(stop_sequence: 2)

    @stop1 = Stop.create!(stop_id: "1", stop_name: "stop1", stop_lat: 10, stop_lon: 10)
    @stop2 = Stop.create!(stop_id: "2", stop_name: "stop2", stop_lat: 10, stop_lon: 10)

    @route_stop1.stop = @stop1
    @route_stop2.stop = @stop2

    @route.route_stops << @route_stop1
    @route.route_stops << @route_stop2
	end

  it { should have_many(:route_stops)}
  it { should have_many(:stops).through(:route_stops) }

  it { should respond_to(:route_id) }
  it { should respond_to(:route_short_name) }
  it { should respond_to(:route_long_name) }
  it { should respond_to(:route_desc) }

  it "should have unique route_id" do
    @route_copy = Route.new( route_id: '1', route_short_name: 'test route', route_long_name: 'longer name', route_desc: 'route desc' )
    expect(@route_copy).to be_invalid
  end

  it "should store related stops in .stops" do
  	expect(@route.stops).to eq([@stop1, @stop2])
  end

end
