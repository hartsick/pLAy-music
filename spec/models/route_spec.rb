require 'spec_helper'

describe Route do
  it { should have_many(:route_stops)}
  it { should have_many(:stops).through(:route_stops) }
end
