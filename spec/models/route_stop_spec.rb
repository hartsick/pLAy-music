require 'spec_helper'

describe RouteStop, :type => :model do

  it { should belong_to(:stop)}
  it { should belong_to(:route)}

	it { should respond_to(:stop_sequence) }

	before { @routestop = RouteStop.create() }
	subject { @routestop }

	it "is not valid without a stop_sequence" do
		expect(@routestop).to be_invalid
	end

end
