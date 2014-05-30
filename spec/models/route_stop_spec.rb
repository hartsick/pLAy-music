require 'spec_helper'

describe RouteStop, :type => :model do

  it { should belong_to(:stop)}
  it { should belong_to(:route)}

  xit "should be unique" do
	end
end
