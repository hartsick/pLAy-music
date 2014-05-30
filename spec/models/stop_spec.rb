require 'spec_helper'

describe Stop do
	before (:each) do
		@stop = Stop.new
	end
	
  it { should have_many(:route_stops)}
  it { should have_many(:routes).through(:route_stops) }
end
