require 'spec_helper'

describe Stop, :type => :model do
	before (:each) do
		@route_stop1 = RouteStop.new(stop_sequence: 1)
		@route_stop2 = RouteStop.new(stop_sequence: 2)

		@route1 = Route.new(route_id: 1, route_short_name: "route 1")
		@route2 = Route.new(route_id: 2, route_short_name: "route 2")

		@route_stop1.route = @route1
		@route_stop2.route = @route2

		@stop = Stop.create!( stop_id: '1', stop_name: 'test stop', stop_lat: 50.000, stop_lon: -100.000, place_query: 'https://www.com')
	end

	describe "relations:" do
		before (:each) do

			@stop.route_stops << @route_stop1
			@stop.route_stops << @route_stop2
		end
		
	  it { should have_many(:route_stops) }
	  it { should have_many(:routes).through(:route_stops) }
	  it { should have_and_belong_to_many(:hotspots) }
	  it { should have_and_belong_to_many(:songs) }

	  it { should respond_to(:stop_id) }
	  it { should respond_to(:stop_lat) }
	  it { should respond_to(:stop_lon) }
	  it { should respond_to(:place_query) }
	  it { should respond_to(:has_generated_hotspot) }

	  it ".has_generated_hotspot should default to false" do
	  	expect(@stop.has_generated_hotspot).to eq(false)
	  end

	  it "should store related stops in .stops" do
	  	expect(@stop.routes).to eq([@route1, @route2])
	  end

	end

	describe "validations:" do

		it "should be invalid without stop_id" do
			stop = Stop.new(stop_lat: 10, stop_lon: 10)
			stop.route_stops << @route_stop1
			
			expect(stop).to be_invalid
		end

		it "should be invalid without stop_lat" do
			stop = Stop.new(stop_id: 10, stop_lon: 10)
			stop.route_stops << @route_stop1

			expect(stop).to be_invalid
		end

		it "should be invalid without stop_lon" do
			stop = Stop.new(stop_id: 10, stop_lat: 10)
			stop.route_stops << @route_stop1

			expect(stop).to be_invalid
		end

	  it "should have unique stop_id" do
			@stop_copy = Stop.new( stop_id: '1', stop_name: 'test stop', stop_lat: 50.000, stop_lon: -100.000, place_query: 'https://www.com' )
	    expect(@stop_copy).to be_invalid
	  end
	end

	describe "#generate_place_query" do
		subject { @stop.generate_place_query }

		it "should return a string" do
			expect(@stop.generate_place_query).to be_a(String)
		end

		xit "should save the string to place_query in stops table" do
		end

		xit "should be invalid if not in proper URL format" do
			stop = Stop.new( stop_id: '3', stop_name: '', stop_lat: 100, stop_lon: 100, place_query: 'x')
			expect(stop).to be_invalid
		end

		it { should include(@stop.stop_lat.to_s) }
		it { should include(@stop.stop_lon.to_s) }

	end

	describe "#init" do
		before(:each) do
			@placeless = Stop.new( stop_id: '1', stop_name: 'test stop', stop_lat: 50.000, stop_lon: -100.000 )
			@placeless.init
		end
		subject { @placeless }
		
		it "should populate .place_query" do
			expect(@placeless.place_query).not_to be_empty
		end
	end

end
